#!/usr/bin/env python3
import sys
from PyQt6.QtWidgets import QApplication, QWidget, QLabel, QVBoxLayout
from PyQt6.QtCore import Qt

class Popup(QWidget):
    def __init__(self, text):
        super().__init__()
        self.setWindowFlags(
            Qt.WindowType.FramelessWindowHint |
            Qt.WindowType.WindowStaysOnTopHint |
            Qt.WindowType.Tool
        )
        self.setStyleSheet("""
            QWidget {
                background-color: #141414;
                border-radius: 8px;
            }
        """)

        layout = QVBoxLayout()
        layout.setContentsMargins(20, 16, 20, 16)
        layout.setSpacing(8)

        title = QLabel("Translation")
        title.setStyleSheet("color: #888888; font-size: 13px; font-family: 'JetBrains Mono';")

        body = QLabel(text)
        body.setStyleSheet("color: #f5f5f5; font-size: 14px; font-family: 'JetBrains Mono';")
        body.setWordWrap(True)
        body.setFixedWidth(400)

        source = QLabel("by Google Translate")
        source.setStyleSheet("color: #444444; font-size: 11px; font-family: 'JetBrains Mono';")
        source.setAlignment(Qt.AlignmentFlag.AlignRight)
        layout.addWidget(source)

        layout.addWidget(title)
        layout.addWidget(body)
        self.setLayout(layout)
        self.adjustSize()

        screen = QApplication.primaryScreen().geometry()
        self.move(
            screen.center().x() - self.width() // 2,
            screen.center().y() - self.height() // 2
        )

    def keyPressEvent(self, event):
        self.close()

    def mousePressEvent(self, event):
        self.close()

if __name__ == "__main__":
    text = sys.argv[1] if len(sys.argv) > 1 else "Metin yok."
    app = QApplication(sys.argv)
    popup = Popup(text)
    popup.show()
    popup.raise_()
    popup.activateWindow()
    sys.exit(app.exec())
