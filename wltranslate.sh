#!/bin/bash
# wltranslate - Wayland OCR Translation Tool
# https://github.com/asaf/wltranslate

LANG_TO="${1:-tr}"
IMG=/tmp/wltranslate-shot.png
TEXT_FILE=/tmp/wltranslate-text

grim -g "$(slurp)" "$IMG" || { notify-send "wltranslate" "Ekran yakalama başarısız."; exit 1; }

tesseract "$IMG" "$TEXT_FILE" 2>/dev/null || { notify-send "wltranslate" "OCR başarısız."; exit 1; }

TRANSLATED=$(python3 -c "
from googletrans import Translator
text = open('${TEXT_FILE}.txt').read().strip()
if not text:
    print('Metin bulunamadı.')
    exit()
t = Translator()
result = t.translate(text, dest='${LANG_TO}')
print(result.text)
")

notify-send "wltranslate" "$TRANSLATED"
