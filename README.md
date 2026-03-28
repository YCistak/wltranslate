# wltranslate

Wayland'da ekrandan alan seç, metni tanı, çevir — bildirim olarak göster.

## Bağımlılıklar

- grim
- slurp
- tesseract
- python3
- googletrans

## Kurulum

```bash
git clone https://github.com/asaf/wltranslate
cd wltranslate
chmod +x install.sh
./install.sh
```

## Kullanım

```bash
wltranslate          # Türkçeye çevirir (varsayılan)
wltranslate en       # İngilizceye çevirir
wltranslate de       # Almancaya çevirir
```

## Hyprland Kısayolu

`~/.config/hypr/hyprland.conf` dosyasına ekle:

```
bind = ALT, V, exec, wltranslate
```

## Nasıl Çalışır

1. `grim + slurp` — ekrandan alan seçilir, PNG kaydedilir
2. `tesseract` — PNG'den metin okunur (OCR)
3. `googletrans` — metin Google Translate'e gönderilir
4. `notify-send` — çeviri bildirim olarak gösterilir

## Lisans

MIT
