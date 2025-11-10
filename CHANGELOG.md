# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2025-11-10

### 🎉 新增三種充滿台灣味的趣味風格

專為台灣開發者設計，充滿人味與趣味，讓寫程式變得更有樂趣！

### Added
- ✨ 周星馳無厘頭工程師風格 (`/tw-style-stephen-chow`)
  - 經典港片無厘頭對白風格
  - 技術正經，表達搞笑
  - 用電影台詞類比技術概念
- 💕 甜蜜女友工程師風格 (`/tw-style-sweet-girlfriend`)
  - 溫柔體貼，稱呼「寶貝」
  - 鼓勵式教學，永遠支持
  - 專業但充滿溫暖
- 🏪 台灣夜市老闆工程師風格 (`/tw-style-night-market`)
  - 超熱情、很接地氣
  - 台灣國語 + 偶爾台語
  - 實在、講究俗擱大碗（CP 值超高）

### Changed
- 📚 更新文檔說明新的風格選項
- 🎨 將風格分為「台灣味趣味風格」和「經典動漫風格」兩類
- 📝 更新 tw-style-list 命令輸出，包含所有 7 種風格

### Improved
- 🌏 更貼近台灣開發者的語言習慣和文化
- 🎭 提供更多元的個性化選擇
- 💡 在不影響技術品質的前提下增加對話趣味性

---

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
