#!/bin/bash

# Example: ./transcribe_cpp.sh "audio/Meeting in C-Sharp .NET-20250611_131952-Motesinspelning" sv
#          ./transcribe_cpp.sh "audio/myfile" auto

# --- Config ---
MODEL="whisper.cpp/models/ggml-base.bin"
OUTPUT_DIR="transcripts"
WHISPER="./whisper.cpp/build/bin/whisper-cli"

# --- Check input ---
if [ -z "$1" ]; then
  echo "❌ Please provide an audio file name or path."
  exit 1
fi

INPUT_BASENAME="$1"
LANGUAGE="${2:-auto}"  # default to auto-detection

# Try known extensions if file is missing
EXTENSIONS=("m4a" "mp4" "mp3" "wav" "aac")
FOUND_FILE=""
for ext in "${EXTENSIONS[@]}"; do
  if [ -f "${INPUT_BASENAME}.${ext}" ]; then
    FOUND_FILE="${INPUT_BASENAME}.${ext}"
    break
  elif [ -f "${INPUT_BASENAME}" ]; then
    FOUND_FILE="${INPUT_BASENAME}"
    break
  fi
done

if [ -z "$FOUND_FILE" ]; then
  echo "❌ File not found: $INPUT_BASENAME"
  exit 1
fi

INPUT="$FOUND_FILE"
mkdir -p "$OUTPUT_DIR"

# --- Create safe output filename ---
filename=$(basename "$INPUT")
name="${filename%.*}"

# Sluggify name
safe_name=$(echo "$name" | iconv -f utf8 -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')

# --- Convert to WAV ---
converted="audio/converted.wav"
ffmpeg -y -i "$INPUT" -ar 16000 -ac 1 "$converted" || {
  echo "❌ Error converting input file with ffmpeg."
  exit 1
}

echo "🎙️  Converted to: $converted"
echo "🌍 Language: $LANGUAGE"

# --- Transcribe ---
$WHISPER \
  -m "$MODEL" \
  -f "$converted" \
  -l "$LANGUAGE" \
  -otxt -osrt \
  -of "$OUTPUT_DIR/$safe_name"

# --- Done ---
echo "✅ Done! Transcript saved in: $OUTPUT_DIR/$safe_name.txt"