# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-05

### Added
- Initial release of Claude TW Engineer Styles Plugin
- Four Traditional Chinese engineer personality styles:
  - Professional Engineer (engineer-professional)
  - Laowang Tech Flow (laowang-engineer)
  - Nekomata Engineer (nekomata-engineer)
  - Ojousama Engineer (ojousama-engineer)
- SessionStart hook integration for automatic style injection
- Automatic style detection from Claude Code settings.json
- Complete bilingual documentation (Traditional Chinese and English)
- MIT License

### Features
- ✨ Four unique engineer personalities with distinct communication styles
- 🎯 Strict adherence to SOLID, KISS, DRY, YAGNI principles
- 🔧 Easy configuration via settings.json
- 📦 Clean plugin structure following Claude Code v2.0.30+ standards
- 🌏 Full Traditional Chinese (zh-TW) support

### Documentation
- Comprehensive README with installation and usage guides
- Detailed style descriptions and example dialogues
- Troubleshooting guide
- Project structure documentation

### Technical
- Bash-based SessionStart hook handler
- JSON-safe content escaping
- Fallback to default style if configuration missing
- Cross-platform compatibility (macOS, Linux, Windows WSL)

---

## Future Plans

### [1.1.0] - Planned
- [ ] Add configuration UI for easier style selection
- [ ] Support for custom user-defined styles
- [ ] Style preview command
- [ ] Multi-language support (add English styles)

### [1.2.0] - Planned
- [ ] Interactive style switcher during session
- [ ] Style combination modes
- [ ] Advanced customization options

---

**Note:** This project adapts to Claude Code's migration from Output Styles to Plugin architecture (effective November 5, 2025).
