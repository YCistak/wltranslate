#!/bin/bash
IMG=/tmp/ocr-shot.png

SELECTION=$(slurp 2>/dev/null) || exit 0
grim -g "$SELECTION" "$IMG" || exit 0
tesseract "$IMG" /tmp/ocr-text 2>/dev/null
TEXT=$(cat /tmp/ocr-text.txt)

TRANSLATED=$(python3 -c "
from googletrans import Translator
text = open('/tmp/ocr-text.txt').read().strip()
t = Translator()
result = t.translate(text, dest='tr')
print(result.text)
")

python3 ~/.local/bin/wltranslate-popup.py "$TRANSLATED"
