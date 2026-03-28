# wltranslate

Select an area on your Wayland screen, extract the text via OCR, and get a translated notification instantly.

## Dependencies

- grim
- slurp
- tesseract
- python3
- googletrans

## Installation

\```bash
git clone https://github.com/YCistak/wltranslate
cd wltranslate
chmod +x install.sh
./install.sh
\```

## Usage

\```bash
wltranslate          # Translates to Turkish (default)
wltranslate en       # Translates to English
wltranslate de       # Translates to German
\```

## Keybind (Hyprland)

Add to `~/.config/hypr/hyprland.conf`:
```
bind = ALT, V, exec, wltranslate
```

Other compositors (Sway, etc.) have their own keybind configuration — refer to your compositor's documentation.`

## How It Works

1. grim + slurp — select an area on screen, save as PNG
2. tesseract — extract text from PNG (OCR)
3. googletrans — send text to Google Translate
4. notify-send — display translation as a notification

## License

MIT
