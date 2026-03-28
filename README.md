# wltranslate

Select an area on your Wayland screen, extract the text via OCR, and get a translated popup instantly.

## Dependencies

- grim
- slurp
- tesseract
- python3
- python-pyqt6
- googletrans

## Installation
```bash
git clone https://github.com/YCistak/wltranslate
cd wltranslate
chmod +x install.sh
./install.sh
```

## Usage
```bash
wltranslate          # Translates to Turkish (default)
wltranslate en       # Translates to English
wltranslate de       # Translates to German
```

Press ESC during selection to cancel. Click anywhere or press any key to close the popup.

## Hyprland Setup

Add to `~/.config/hypr/hyprland.conf`:
```
windowrule = float on, match:title wltranslate-popup.py
windowrule = center on, match:title wltranslate-popup.py
bind = ALT, V, exec, wltranslate
```

## How It Works

1. grim + slurp — select an area on screen, save as PNG
2. tesseract — extract text from PNG (OCR)
3. googletrans — send text to Google Translate
4. PyQt6 popup — display translation in a centered floating window

## License

MIT
