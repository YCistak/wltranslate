#!/bin/bash
# wltranslate installer

set -e

echo "wltranslate kurulum başlıyor..."

if command -v yay &>/dev/null; then
    yay -S --needed grim slurp tesseract tesseract-data-eng python-pip
elif command -v pacman &>/dev/null; then
    sudo pacman -S --needed grim slurp tesseract tesseract-data-eng python-pip
else
    echo "Desteklenmeyen paket yöneticisi. grim, slurp, tesseract, python-pip manuel kur."
    exit 1
fi

python3 -m pip install googletrans==4.0.0rc1 --break-system-packages

mkdir -p ~/.local/bin
cp wltranslate.sh ~/.local/bin/wltranslate
chmod +x ~/.local/bin/wltranslate

echo ""
echo "Kurulum tamamlandı."
echo "Hyprland kısayolu için hyprland.conf'a ekle:"
echo "  bind = ALT, V, exec, wltranslate"
