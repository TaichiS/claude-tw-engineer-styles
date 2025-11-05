# 🤝 貢獻指南 | Contributing Guide

感謝您對 Claude TW Engineer Styles Plugin 的興趣！我們歡迎所有形式的貢獻。

[繁體中文](#繁體中文) | [English](#english)

---

## 繁體中文

### 如何貢獻

我們歡迎以下類型的貢獻：

1. **🐛 報告問題（Bug Reports）**
2. **✨ 功能建議（Feature Requests）**
3. **📝 改進文檔（Documentation）**
4. **🎨 新增輸出風格（New Styles）**
5. **🔧 程式碼改進（Code Improvements）**
6. **🌏 翻譯（Translations）**

### 報告問題

如果您發現了 Bug，請：

1. 前往 [Issues 頁面](https://github.com/TaichiS/claude-tw-engineer-styles/issues)
2. 點擊 "New Issue"
3. 使用以下模板：

```markdown
**描述問題**
清楚簡潔地描述問題是什麼。

**重現步驟**
重現問題的步驟：
1. 執行 '...'
2. 看到錯誤 '...'

**預期行為**
應該發生什麼。

**實際行為**
實際發生了什麼。

**環境**
- OS: [例如 macOS 14.0]
- Claude Code 版本: [例如 v2.0.30]
- Plugin 版本: [例如 v1.0.0]

**附加資訊**
其他相關資訊、截圖等。
```

### 功能建議

想要新功能？請：

1. 先檢查 [Issues](https://github.com/TaichiS/claude-tw-engineer-styles/issues) 是否已有類似建議
2. 如果沒有，創建新 Issue 並使用 "enhancement" 標籤
3. 詳細描述您的想法和使用場景

### 提交程式碼

#### 開發流程

1. **Fork 本專案**
   ```bash
   # 在 GitHub 上點擊 Fork 按鈕
   ```

2. **Clone 您的 Fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/claude-tw-engineer-styles.git
   cd claude-tw-engineer-styles
   ```

3. **創建功能分支**
   ```bash
   git checkout -b feature/amazing-feature
   # 或
   git checkout -b fix/bug-fix
   ```

4. **進行修改**
   - 遵循現有的程式碼風格
   - 確保腳本可執行：`chmod +x your-script.sh`
   - 測試您的修改

5. **測試**
   ```bash
   # 執行驗證
   ./verify.sh

   # 測試 Hook
   ./test-hook.sh

   # 測試安裝
   ./install.sh

   # 預覽風格
   ./preview-styles.sh
   ```

6. **提交變更**
   ```bash
   git add .
   git commit -m "feat: add amazing feature

   - Detailed description of changes
   - Why this change is needed
   - Any breaking changes

   🇹🇼 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>"
   ```

7. **推送到 Fork**
   ```bash
   git push origin feature/amazing-feature
   ```

8. **創建 Pull Request**
   - 前往您 Fork 的 GitHub 頁面
   - 點擊 "Pull Request"
   - 填寫 PR 描述

#### Commit Message 格式

我們使用 [Conventional Commits](https://www.conventionalcommits.org/) 規範：

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Type:**
- `feat`: 新功能
- `fix`: Bug 修復
- `docs`: 文檔變更
- `style`: 程式碼格式變更
- `refactor`: 重構
- `test`: 測試相關
- `chore`: 建構流程或輔助工具變更

**例子：**
```
feat(styles): add cyberpunk engineer style

- Add new cyberpunk-themed output style
- Include neon-colored responses
- Add futuristic terminology

🇹🇼 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### 新增輸出風格

想要創建新的輸出風格？請：

1. **在 `styles/` 目錄創建新的 `.md` 文件**
   ```bash
   cp styles/engineer-professional.md styles/your-style.md
   ```

2. **編輯 frontmatter**
   ```markdown
   ---
   name: your-style
   description: 您的風格描述
   ---
   ```

3. **撰寫風格內容**
   - 參考現有風格的結構
   - 包含核心行為規範
   - 定義響應特點
   - 遵循 SOLID, KISS, DRY, YAGNI 原則

4. **更新 `hooks-handlers/session-start.sh`**
   ```bash
   SUPPORTED_STYLES=("engineer-professional" "laowang-engineer" "nekomata-engineer" "ojousama-engineer" "your-style")
   ```

5. **測試新風格**
   ```bash
   # 創建測試配置
   echo '{"outputStyle": "your-style"}' > ~/.claude/settings.json

   # 測試 Hook
   CLAUDE_PLUGIN_ROOT="$(pwd)" ./hooks-handlers/session-start.sh
   ```

6. **更新文檔**
   - 在 README.md 中添加新風格介紹
   - 更新 preview-styles.sh 腳本

7. **提交 PR**

### 程式碼風格

- **Shell Scripts**:
  - 使用 Bash
  - 4 空格縮排
  - 函數使用 snake_case
  - 變數使用 UPPER_CASE（全局）或 lower_case（局部）

- **Markdown**:
  - 使用標準 Markdown 語法
  - 中文和英文之間添加空格
  - 列表使用 `-` 而非 `*`

- **JSON**:
  - 2 空格縮排
  - 使用雙引號
  - 遵循 Claude Code Plugin 規範

### Pull Request 檢查清單

提交 PR 前請確認：

- [ ] 程式碼已測試且可運行
- [ ] 所有腳本都有可執行權限
- [ ] 更新了相關文檔
- [ ] Commit message 遵循規範
- [ ] 沒有包含敏感資訊
- [ ] 驗證腳本通過（`./verify.sh`）
- [ ] Hook 測試通過（`./test-hook.sh`）

### 文檔貢獻

改進文檔是非常寶貴的貢獻！

**可以改進的地方：**
- 修正拼寫或語法錯誤
- 改進說明的清晰度
- 添加更多範例
- 翻譯成其他語言
- 添加使用場景說明

### 審查流程

1. 提交 PR 後，維護者會進行審查
2. 可能會要求修改
3. 通過審查後會被合併
4. 您的貢獻會被記錄在 CHANGELOG.md

### 行為準則

- 🤝 尊重他人
- 💬 使用友善、包容的語言
- 🎯 專注於建設性的回饋
- 🌟 歡迎新手
- 📝 清晰溝通

---

## English

### How to Contribute

We welcome the following types of contributions:

1. **🐛 Bug Reports**
2. **✨ Feature Requests**
3. **📝 Documentation Improvements**
4. **🎨 New Output Styles**
5. **🔧 Code Improvements**
6. **🌏 Translations**

### Reporting Issues

If you find a bug:

1. Go to [Issues page](https://github.com/TaichiS/claude-tw-engineer-styles/issues)
2. Click "New Issue"
3. Use the template format shown above

### Submitting Code

Follow the development flow described in the Chinese section above.

Key points:
- Fork the repository
- Create a feature branch
- Make your changes
- Test thoroughly
- Submit a Pull Request

### Code Style

- **Shell Scripts**: Bash with 4-space indentation
- **Markdown**: Standard syntax with proper spacing
- **JSON**: 2-space indentation, double quotes

### Pull Request Checklist

Before submitting:
- [ ] Code tested and working
- [ ] Scripts are executable
- [ ] Documentation updated
- [ ] Commit messages follow conventions
- [ ] No sensitive information included
- [ ] Verification passes (`./verify.sh`)
- [ ] Hook tests pass (`./test-hook.sh`)

### Code of Conduct

- Be respectful
- Use welcoming language
- Focus on constructive feedback
- Welcome newcomers
- Communicate clearly

---

## 🙏 致謝 | Acknowledgments

感謝所有貢獻者讓這個專案變得更好！

Thank you to all contributors for making this project better!

## 📞 聯繫 | Contact

- GitHub Issues: [Report a problem](https://github.com/TaichiS/claude-tw-engineer-styles/issues)
- GitHub Discussions: [Join the conversation](https://github.com/TaichiS/claude-tw-engineer-styles/discussions)

---

**再次感謝您的貢獻！ | Thank you for your contribution!** 🎉
