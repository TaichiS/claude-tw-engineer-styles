# ❓ 常見問題 | FAQ

[繁體中文](#繁體中文) | [English](#english)

---

## 繁體中文

### 安裝與配置

<details>
<summary><strong>Q: 如何知道 plugin 是否已成功安裝？</strong></summary>

執行驗證腳本：
```bash
~/.claude/plugins/claude-tw-engineer-styles/verify.sh
```

或檢查目錄是否存在：
```bash
ls -la ~/.claude/plugins/claude-tw-engineer-styles
```

如果看到 `.claude-plugin/`, `hooks/`, `hooks-handlers/`, `styles/` 目錄，說明安裝成功。
</details>

<details>
<summary><strong>Q: 安裝後需要重啟 Claude Code 嗎？</strong></summary>

是的，安裝或更改配置後需要重啟 Claude Code 才能生效。
</details>

<details>
<summary><strong>Q: 如何切換不同的輸出風格？</strong></summary>

編輯 `~/.claude/settings.json`：
```json
{
  "outputStyle": "nekomata-engineer"
}
```

可用值：
- `engineer-professional`
- `laowang-engineer`
- `nekomata-engineer`
- `ojousama-engineer`

修改後重啟 Claude Code。
</details>

<details>
<summary><strong>Q: 可以同時使用多個輸出風格嗎？</strong></summary>

目前一次只能使用一個輸出風格。未來版本可能會支援風格組合模式。
</details>

### 故障排除

<details>
<summary><strong>Q: Plugin 安裝了但沒有效果怎麼辦？</strong></summary>

1. **檢查 Claude Code 版本**
   ```bash
   claude --version
   ```
   需要 v2.0.30 或更高版本。

2. **檢查配置檔案**
   ```bash
   cat ~/.claude/settings.json
   ```
   確認 `outputStyle` 設定正確。

3. **檢查腳本權限**
   ```bash
   ls -la ~/.claude/plugins/claude-tw-engineer-styles/hooks-handlers/session-start.sh
   ```
   應該有 `x`（可執行）權限。如果沒有：
   ```bash
   chmod +x ~/.claude/plugins/claude-tw-engineer-styles/hooks-handlers/session-start.sh
   ```

4. **查看 debug 輸出**
   ```bash
   claude --debug
   ```

5. **重新安裝**
   ```bash
   cd /path/to/claude-tw-engineer-styles
   ./uninstall.sh
   ./install.sh
   ```
</details>

<details>
<summary><strong>Q: 遇到 "Python not found" 錯誤</strong></summary>

Plugin 需要 Python 3 來進行 JSON 處理。

**macOS/Linux:**
```bash
which python3
```

如果沒有安裝：
- **macOS**: `brew install python3`
- **Ubuntu/Debian**: `sudo apt install python3`
- **CentOS/RHEL**: `sudo yum install python3`

</details>

<details>
<summary><strong>Q: "Repository not found" 錯誤</strong></summary>

這表示您嘗試推送到尚未創建的 GitHub 儲存庫。請先在 GitHub 上創建儲存庫：
https://github.com/new

參考 `CREATE_GITHUB_REPO.md` 獲取詳細步驟。
</details>

<details>
<summary><strong>Q: Hook 腳本執行失敗</strong></summary>

測試 Hook 腳本：
```bash
cd ~/.claude/plugins/claude-tw-engineer-styles
CLAUDE_PLUGIN_ROOT="$(pwd)" ./hooks-handlers/session-start.sh
```

如果看到錯誤，檢查：
1. 腳本是否有執行權限
2. Python 3 是否已安裝
3. 風格檔案是否存在於 `styles/` 目錄
</details>

### 使用相關

<details>
<summary><strong>Q: 哪種風格最適合我？</strong></summary>

**選擇指南：**

- **engineer-professional**
  - ✅ 適合：企業開發、團隊協作、正式專案
  - 🎯 特點：純技術導向、專業嚴謹
  - 👥 目標用戶：有經驗的專業開發者

- **laowang-engineer**
  - ✅ 適合：個人專案、輕鬆開發環境
  - 🎯 特點：幽默風趣、接地氣、暴躁但專業
  - 👥 目標用戶：喜歡輕鬆氛圍的開發者

- **nekomata-engineer**
  - ✅ 適合：個人專案、學習環境
  - 🎯 特點：可愛貓娘 + 專業素養
  - 👥 目標用戶：喜歡可愛風格的開發者

- **ojousama-engineer**
  - ✅ 適合：個人專案、娛樂開發
  - 🎯 特點：高貴優雅、傲嬌人設
  - 👥 目標用戶：喜歡傲嬌角色的開發者

您可以使用 `./preview-styles.sh` 預覽每種風格。
</details>

<details>
<summary><strong>Q: 風格會影響代碼品質嗎？</strong></summary>

不會。所有風格都嚴格遵循相同的編程原則：
- SOLID 原則
- KISS (Keep It Simple)
- DRY (Don't Repeat Yourself)
- YAGNI (You Aren't Gonna Need It)

不同的只是溝通風格和個性表達，代碼品質和專業性保持一致。
</details>

<details>
<summary><strong>Q: 可以自訂自己的風格嗎？</strong></summary>

可以！步驟：

1. 複製現有風格：
   ```bash
   cd ~/.claude/plugins/claude-tw-engineer-styles/styles
   cp engineer-professional.md my-custom-style.md
   ```

2. 編輯新風格文件

3. 更新 `hooks-handlers/session-start.sh` 中的 `SUPPORTED_STYLES` 陣列

4. 在 `settings.json` 中使用新風格名稱

未來版本會提供更簡單的自訂方式。
</details>

### 技術相關

<details>
<summary><strong>Q: Plugin 如何工作？</strong></summary>

**工作原理：**

1. Claude Code 啟動時觸發 `SessionStart` hook
2. Hook 執行 `hooks-handlers/session-start.sh` 腳本
3. 腳本從 `~/.claude/settings.json` 讀取配置的風格
4. 讀取對應的 `.md` 文件內容
5. 將內容作為 `additionalContext` 注入到 Claude 的 session
6. Claude Code 根據這些指示調整輸出風格

**技術細節：**
- Hook 類型: SessionStart
- Hook 格式: command (Shell script)
- 輸出格式: JSON with hookSpecificOutput
- 內容來源: Markdown 文件
</details>

<details>
<summary><strong>Q: 為什麼不直接修改 settings.json 的 systemPrompt？</strong></summary>

Plugin 架構的優勢：
- ✅ 更靈活的配置管理
- ✅ 易於安裝和卸載
- ✅ 可以動態切換
- ✅ 符合 Claude Code v2.0.30+ 標準
- ✅ 不會覆蓋其他配置

Plugin 是 Claude Code 官方推薦的方式來擴展功能。
</details>

<details>
<summary><strong>Q: Plugin 會影響性能嗎？</strong></summary>

影響非常小：
- Hook 只在 session 開始時執行一次
- 腳本執行時間 <100ms
- 內容大小 2-7 KB
- 不會影響後續的對話響應速度

對於正常使用來說幾乎察覺不到。
</details>

<details>
<summary><strong>Q: 支援哪些平台？</strong></summary>

**已測試平台：**
- ✅ macOS (Intel & Apple Silicon)
- ✅ Linux (Ubuntu, Debian, CentOS, Arch)
- ✅ Windows WSL2

**要求：**
- Claude Code v2.0.30+
- Bash shell
- Python 3.x
- 基本的 Unix 工具 (grep, sed, awk)

</details>

### 貢獻與開發

<details>
<summary><strong>Q: 如何貢獻新的輸出風格？</strong></summary>

請參考 `CONTRIBUTING.md` 中的「新增輸出風格」章節。

簡要步驟：
1. Fork 專案
2. 創建新的風格文件
3. 測試功能
4. 提交 Pull Request

我們歡迎所有創意風格！
</details>

<details>
<summary><strong>Q: 可以提議新功能嗎？</strong></summary>

當然可以！請在 [GitHub Issues](https://github.com/TaichiS/claude-tw-engineer-styles/issues) 創建功能請求。

請包含：
- 功能描述
- 使用場景
- 期望的行為
- 為什麼這個功能有用

</details>

---

## English

### Installation & Configuration

<details>
<summary><strong>Q: How do I know if the plugin is successfully installed?</strong></summary>

Run the verification script:
```bash
~/.claude/plugins/claude-tw-engineer-styles/verify.sh
```

Or check if the directory exists:
```bash
ls -la ~/.claude/plugins/claude-tw-engineer-styles
```

If you see `.claude-plugin/`, `hooks/`, `hooks-handlers/`, `styles/` directories, the installation is successful.
</details>

<details>
<summary><strong>Q: Do I need to restart Claude Code after installation?</strong></summary>

Yes, you need to restart Claude Code after installation or configuration changes for them to take effect.
</details>

<details>
<summary><strong>Q: How do I switch between different output styles?</strong></summary>

Edit `~/.claude/settings.json`:
```json
{
  "outputStyle": "nekomata-engineer"
}
```

Available values:
- `engineer-professional`
- `laowang-engineer`
- `nekomata-engineer`
- `ojousama-engineer`

Restart Claude Code after making changes.
</details>

### Troubleshooting

<details>
<summary><strong>Q: Plugin installed but not working?</strong></summary>

Follow the troubleshooting steps in the Chinese section above.

Key checks:
1. Claude Code version (v2.0.30+)
2. settings.json configuration
3. Script permissions
4. Debug output
5. Reinstallation
</details>

<details>
<summary><strong>Q: "Python not found" error</strong></summary>

The plugin requires Python 3 for JSON processing.

Install Python 3:
- **macOS**: `brew install python3`
- **Ubuntu/Debian**: `sudo apt install python3`
- **CentOS/RHEL**: `sudo yum install python3`
</details>

### Usage

<details>
<summary><strong>Q: Which style is best for me?</strong></summary>

See the style selection guide in the Chinese section above.

Use `./preview-styles.sh` to preview each style.
</details>

<details>
<summary><strong>Q: Do styles affect code quality?</strong></summary>

No. All styles follow the same programming principles:
- SOLID principles
- KISS (Keep It Simple)
- DRY (Don't Repeat Yourself)
- YAGNI (You Aren't Gonna Need It)

Only the communication style and personality differ, not the code quality or professionalism.
</details>

---

## 📚 更多資源 | More Resources

- [完整文檔 | Full Documentation](README.md)
- [貢獻指南 | Contributing Guide](CONTRIBUTING.md)
- [變更日誌 | Changelog](CHANGELOG.md)
- [專案總結 | Project Summary](SUMMARY.md)
- [GitHub Setup Guide](GITHUB_SETUP.md)

## 💬 還有其他問題？ | More Questions?

- [GitHub Issues](https://github.com/TaichiS/claude-tw-engineer-styles/issues)
- [GitHub Discussions](https://github.com/TaichiS/claude-tw-engineer-styles/discussions)

---

**找不到您的問題？歡迎提出！ | Can't find your question? Feel free to ask!** 💬
