#!/bin/bash

mkdir -p transcripts

for file in audio/*; do
  echo "🎤 Transcribing $file..."
  whisper "$file" --language sv --output_dir transcripts --model base
done