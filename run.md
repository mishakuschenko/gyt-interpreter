### Установите dart:

# с официального сайта:
## https://dart.dev/get-dart?spm=2b75ac3d.2ef5001f.0.0.53fec921fhhiVU

# Windows:
```bash
choco install dart-sdk
```
# MacOS:
```bash
brew tap dart-lang/dart
brew install dart
```
# Linux:
## Debain/Mint:
```bash
sudo apt-get install apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt-get update
sudo apt-get install dart
```
## Arch:
```bash
sudo pacman -Suy
sudo pacman -S dart
```

### Запуск:
```bash 
git clone https://github.com/mishakuschenko/gyt-interpreter.git 
dart main.dart <file>.gyt 
```

### Сборка:
```bash
dart compile exe main.dart -o gyt --target=#your OS:
```
| Платформа               | Флаг компиляции        |
|-------------------------|------------------------|
| Windows (64-bit)        | `--target=win_x64`     |
| Linux (64-bit)          | `--target=linux_x64`   |
| macOS (Intel)           | `--target=macos_x64`   |
| macOS (Apple Silicon)   | `--target=macos_arm64` |
