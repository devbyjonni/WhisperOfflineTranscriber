# WhisperOfflineTranscriber

🎤 **WhisperOfflineTranscriber** is a simple offline speech-to-text tool built for macOS using OpenAI’s Whisper model (via [`whisper.cpp`](https://github.com/ggerganov/whisper.cpp)).

Easily transcribe `.mp4`, `.m4a`, `.mp3`, or `.wav` files with no internet connection and zero API keys required — great for developers, students, and privacy-conscious users.

---

## 🚀 Features

- 🎧 Transcribe `.mp4`, `.m4a`, `.mp3`, and `.wav` audio/video files
- 🧠 Uses Whisper locally via C++ (no API needed)
- ⚡ Fast and lightweight (thanks to `whisper.cpp`)
- 🔒 Fully offline and privacy-friendly
- ⚙️ Shell script-based for automation
- 🌍 Language auto-detection or force a specific language (like `sv` for Swedish)

---

## 🔧 Tech Stack & How It Works

| Tool                | Role                                                     |
| ------------------- | -------------------------------------------------------- |
| `ffmpeg`            | Converts media files to mono 16kHz WAV for processing    |
| `whisper.cpp`       | Core transcription engine (compiled C++ Whisper model)   |
| `transcribe_cpp.sh` | Your custom wrapper script that ties everything together |
| `iconv` + `sed`     | Slugifies filenames for safe transcript filenames        |

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

> Install FFmpeg if needed:

```bash
brew install ffmpeg
```

---

## ▶️ Usage

1. Drop your audio or video file into the `audio/` folder.
2. Run the transcription script:

```bash
./transcribe_cpp.sh "audio/YourFileName.mp4" sv
```

- Omit `sv` to enable automatic language detection.
- Replace `sv` with any supported language code (`en`, `de`, `fr`, etc.)

3. Output will be saved to the `transcripts/` folder in `.txt`, `.srt`, and `.vtt` formats.

---

## 📁 Folder Structure

```
WhisperOfflineTranscriber/
├── audio/              # Drop your audio/video files here
│   └── .gitkeep
├── transcripts/        # Auto-generated transcripts
│   └── .gitkeep
├── transcribe_cpp.sh   # Main shell script (C++ backend)
├── transcribe.sh       # Optional legacy Python script
├── requirements.txt    # Python dependencies
├── README.md           # Project documentation
└── .gitignore          # Excludes venv, audio, transcripts, etc.
```

---

## 📂 .gitignore Excerpt

```gitignore
venv/
__pycache__/
audio/
!audio/.gitkeep
transcripts/
!transcripts/.gitkeep
*.log
```

---

## 🖲 License

MIT – Free to use, modify, and share.

---

## 💡 Tip

You can fork this repo and adapt it for lectures, meetings, journaling, interviews, or content creation. Offline and private by default — no cloud required.

---

> Created with ❤️ on macOS using `ffmpeg` + `bash` + `whisper.cpp`
