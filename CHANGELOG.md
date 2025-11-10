# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-11-10

### 🎉 Major Changes - On-Demand Loading Architecture

This is a **breaking change** that fundamentally improves how styles are loaded.

### Changed
- **BREAKING:** Removed automatic SessionStart hook injection
- **BREAKING:** Removed settings.json `outputStyle` configuration support
- Migrated from auto-injection to slash command-based on-demand loading
- Updated plugin architecture for better token efficiency

### Added
- ✨ Six new slash commands for style management:
  - `/tw-style-professional` - Activate Professional Engineer style
  - `/tw-style-laowang` - Activate Laowang Tech Flow style
  - `/tw-style-nekomata` - Activate Nekomata Engineer style
  - `/tw-style-ojousama` - Activate Ojousama Engineer style
  - `/tw-style-list` - List all available styles with descriptions
  - `/tw-style-off` - Deactivate current style
- 📊 Token savings: **0 tokens when not in use** (vs ~2000-3000 previously)
- Complete user control over when styles are activated

### Improved
- 🚀 Dramatically reduced token consumption
- 💡 Better user experience with explicit style activation
- 📚 Updated all documentation to reflect new usage patterns
- 🔧 Simplified troubleshooting without settings.json dependencies

### Deprecated
- SessionStart hook auto-injection (removed)
- settings.json `outputStyle` configuration (no longer supported)

### Migration Guide
**Before (v1.0.0):**
```json
// ~/.claude/settings.json
{
  "outputStyle": "nekomata-engineer"
}
```

**After (v2.0.0):**
```bash
# In Claude Code conversation
/tw-style-nekomata
```

The new approach gives you full control and saves tokens!

---

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
