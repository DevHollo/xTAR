# xTAR 📦
**A sleek, user-friendly Bash CLI tool for handling `.tar` archives — created by DevHollo**

![Shell](https://img.shields.io/badge/Bash-CLI-blue?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Linux-informational?style=flat-square)
![License](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square)

---

## 🚀 What is xTAR?

`xTAR` is a simple, readable, and fast Bash script for managing `.tar`, `.tar.gz`, `.tar.xz`, and `.tar.bz2` files.

It supports:
- 📤 Creating archives with chosen formats
- 📥 Extracting archives intelligently (with smart folder detection)
- 🔁 Version checking + clean CLI interface
- 🧪 Future support for auto-updating

Perfect for scripting, backups, or day-to-day CLI archive work on Linux systems.

---

## 🛠️ Installation
- Download the latest version
- Extract the `tar.gz` file
```bash
tar -xzf xTAR-v*.*.*.tar.gz
```

Once installed, run `xtar --help` or `xtar -h`

---

## 📦 Usage

### Extract an archive:
`xtar extract file.tar.gz` or `xtar -e file.tar.gz`


✅ Automatically extracts into a folder *only* if the archive doesn't already contain one.

### Create an archive:
`xtar create file.tar.gz folder/` or `xtar -c file.tar.gz file1 file2`<br>

Supports:
- `.tar`
- `.tar.gz`
- `.tar.xz`
- `tar.bz2`

---

## 🌐 Version Check

xTAR checks for newer versions when you run it. If you're out of date, it lets you know:

```text
🧨 xTAR v0.0.1 is outdated! Latest is v0.1.0.
Run with --update to fetch the latest version.
```

_Update system coming soon!_

---

## 🔮 Roadmap

- [ ] Add `--update` functionality
- [ ] Support `.zip`, `.rar`, and `.7z`
- [ ] Verbose mode and compression flags
- [ ] Custom extract directory via `--to` or `-t`

---

## 💻 Requirements

- Linux (tested on Arch, should work on most distros)
- `tar`
- `bash`
- `curl` (for version checking)

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.

See the [LICENSE](https://github.com/DevHollo/xTAR/blob/main/LICENSE) file for details.

Created by **[DevHollo](https://github.com/DevHollo)**

---

> Found a bug or have a feature idea? [Open an issue](https://github.com/DevHollo/xTAR/issues) or make a PR!