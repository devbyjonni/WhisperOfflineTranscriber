# WhisperOfflineTranscriber

🎤 **WhisperOfflineTranscriber** is a simple offline speech-to-text tool built for macOS using OpenAI’s Whisper model.

Easily transcribe `.m4a`, `.mp3`, or `.wav` files with no internet connection and zero API keys required — great for developers, students, and privacy-conscious users.

---

## 🚀 Features

- 🎧 Transcribe `.m4a`, `.mp3`, and `.wav` audio files
- 🧠 Uses OpenAI Whisper locally (no API needed)
- 🔒 Fully offline, privacy-friendly
- ⚙️ Lightweight shell script for automation
- 🧪 Beginner-friendly setup on macOS
- 🌍 Language auto-detection or force a specific language (like `sv` for Swedish)

---

## ✅ Requirements

- macOS (Apple Silicon tested)
- Python 3.9+
- FFmpeg (install via Homebrew)

---

## 🛠️ Setup

```bash
git clone https://github.com/yourname/WhisperOfflineTranscriber.git
cd WhisperOfflineTranscriber
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## ▶️ Usage

1. Place your audio file inside the `audio/` folder
2. Run the transcription script:

   ```bash
   ./transcribe_cpp.sh "audio/your-audio-file" [language]
   ```

   Replace `[language]` with e.g. `sv` for Swedish or leave it blank for auto-detection.

3. The transcript will be saved to the `transcripts/` folder.

---

## 📁 Folder Structure

```
WhisperOfflineTranscriber/
├── audio/              # Drop your audio files here
├── transcripts/        # Generated transcripts
├── transcribe_cpp.sh   # Shell script to run C++ Whisper transcription
├── transcribe.sh       # Optional Python-based script (legacy)
├── requirements.txt    # Python dependencies
├── README.md           # Project documentation
└── .gitignore          # Excludes virtualenv, audio files, etc.
```

---

## 📂 .gitignore

Make sure to include:

```
venv/
__pycache__/
audio/
*.log
```

---

## 🖲 License

MIT – Free to use, modify, and share.

---

## 💡 Tip

Feel free to fork this repo and adapt it to your own transcription workflows. Whisper also supports timestamps and language detection if you need more advanced use cases.

---

> Created with ❤️ on macOS using Python + Whisper
