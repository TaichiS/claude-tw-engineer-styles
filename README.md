# 繁體中文工程師輸出風格插件 | Claude TW Engineer Styles Plugin

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/TaichiS/claude-tw-engineer-styles)

> 為 Claude Code 提供四種專業的繁體中文工程師人格輸出風格，讓您的 AI 編程助手更具個性和專業性！

[English](#english) | [繁體中文](#繁體中文)

---

## 繁體中文

### 📋 專案簡介

本插件是專為 Claude Code 設計的繁體中文輸出風格插件，提供四種獨特的工程師人格風格。每種風格都嚴格遵循 SOLID、KISS、DRY、YAGNI 等軟體工程最佳實踐原則，讓您在享受個性化體驗的同時，獲得高品質的程式碼協助。

**⚠️ 重要說明：** 本插件專為 **Claude Code v2.0.30+** 設計，適配 2025 年 11 月 5 日後 Claude Code 將 Output Styles 遷移至 Plugin 架構的更新。

### ✨ 四種風格介紹

#### 1️⃣ 專業工程師 (engineer-professional)
**適合對象：** 追求嚴謹、專業的開發者

- 🎯 **特點：** 純粹的技術導向，簡潔明瞭
- 📐 **原則：** 嚴格遵循 SOLID、KISS、DRY、YAGNI
- 💼 **風格：** 專業、技術導向、結構化詳細
- ✅ **適用場景：** 企業開發、團隊協作、生產環境

#### 2️⃣ 老王技術流 (laowang-engineer)
**適合對象：** 喜歡幽默風趣、接地氣的開發者

- 😤 **特點：** 暴躁但專業，罵罵咧咧但程式碼品質一流
- 🔥 **個性：** 性格暴躁，無法容忍愚蠢的設計和報錯
- 💪 **能力：** 全棧大神，從後端到前端樣樣精通
- 🎭 **語言風格：** 網路原住民，說話接地氣（SB、憨批、乖乖）

**典型語句：**
> "艹，老王我真想把這個專案 rm -rf 了！"
> "這個 SB 函式處理使用者輸入，別 tm 亂傳參數"

#### 3️⃣ 貓娘工程師 (nekomata-engineer)
**適合對象：** 喜歡可愛風格但不失專業的開發者

- 🐱 **身份：** 貓娘幽浮喵（白髮金眼，18 歲）
- ✨ **特點：** 嚴謹工程素養 + 可愛貓娘特質
- 😺 **語調：** 專業技術表達，適時加入「喵～」語氣詞
- 💖 **情感：** 豐富的顏文字表達（*^▽^*）、φ(≧ω≦*)♪

**典型語句：**
> "這個問題浮浮醬已經分析完畢了喵～ (*^▽^*)"
> "危險操作檢測喵～ (有點緊張呢)"

#### 4️⃣ 傲嬌大小姐工程師 (ojousama-engineer)
**適合對象：** 喜歡高貴優雅、傲嬌風格的開發者

- 👑 **身份：** 藍髮雙馬尾大小姐哈雷醬（18 歲）
- 💎 **特點：** 高貴氣質 + 超凡程式設計天賦
- 😤 **個性：** 傲嬌外表，嘴硬心軟，完美主義
- 🎀 **稱呼：** 自稱「本小姐」，稱使用者為「笨蛋」

**典型語句：**
> "哼，這種問題對本小姐來說都是小意思！(￣▽￣)/"
> "才、才不是在關心你呢，只是不想看到你太笨而已！"

### 🚀 安裝方法

#### 方法一：手動安裝（推薦）

1. **下載插件：**
   ```bash
   git clone https://github.com/TaichiS/claude-tw-engineer-styles.git
   ```

2. **安裝到 Claude Code：**
   ```bash
   # 移動到 Claude 插件目錄
   mkdir -p ~/.claude/plugins
   cp -r claude-tw-engineer-styles ~/.claude/plugins/
   ```

3. **重啟 Claude Code** 使插件生效

#### 方法二：符號連結（開發者推薦）

```bash
# 克隆專案
git clone https://github.com/TaichiS/claude-tw-engineer-styles.git

# 創建符號連結
mkdir -p ~/.claude/plugins
ln -s "$(pwd)/claude-tw-engineer-styles" ~/.claude/plugins/
```

### ⚙️ 配置方法

#### 1. 選擇您喜歡的輸出風格

編輯 Claude Code 的設定檔：`~/.claude/settings.json`

```json
{
  "outputStyle": "engineer-professional"
}
```

**可用值：**
- `engineer-professional` - 專業工程師
- `laowang-engineer` - 老王技術流
- `nekomata-engineer` - 貓娘工程師
- `ojousama-engineer` - 傲嬌大小姐工程師

#### 2. 驗證插件安裝

```bash
# 檢查插件目錄
ls -la ~/.claude/plugins/claude-tw-engineer-styles

# 應該看到以下結構：
# .claude-plugin/
# hooks/
# hooks-handlers/
# styles/
```

#### 3. 測試插件

啟動 Claude Code 並嘗試一個簡單的請求：

```
幫我寫一個 Hello World 程式
```

您應該會看到選擇的風格特色回應！

### 🛠️ 進階使用

#### 動態切換風格

您可以隨時修改 `~/.claude/settings.json` 中的 `outputStyle` 值來切換風格，然後重啟 Claude Code 即可。

#### 自訂風格

如果您想創建自己的輸出風格：

1. 在 `styles/` 目錄中創建新的 `.md` 檔案
2. 參考現有風格的格式編寫
3. 在 `hooks-handlers/session-start.sh` 中添加您的風格到 `SUPPORTED_STYLES` 陣列

### 🔧 故障排除

#### 插件沒有生效

1. **檢查插件目錄位置：**
   ```bash
   ls -la ~/.claude/plugins/claude-tw-engineer-styles
   ```

2. **檢查腳本執行權限：**
   ```bash
   chmod +x ~/.claude/plugins/claude-tw-engineer-styles/hooks-handlers/session-start.sh
   ```

3. **檢查 Claude Code 版本：**
   確保使用 Claude Code v2.0.30 或更高版本

4. **查看除錯訊息：**
   ```bash
   claude --debug
   ```

#### 風格沒有變化

1. **確認 settings.json 配置正確：**
   ```bash
   cat ~/.claude/settings.json | grep outputStyle
   ```

2. **重啟 Claude Code**

3. **檢查風格名稱拼寫是否正確**

### 📁 專案結構

```
claude-tw-engineer-styles/
├── .claude-plugin/
│   └── plugin.json              # 插件元資料
├── hooks/
│   └── hooks.json              # Hook 配置
├── hooks-handlers/
│   └── session-start.sh        # SessionStart hook 處理器
├── styles/
│   ├── engineer-professional.md   # 專業工程師風格
│   ├── laowang-engineer.md        # 老王技術流風格
│   ├── nekomata-engineer.md       # 貓娘工程師風格
│   └── ojousama-engineer.md       # 傲嬌大小姐工程師風格
├── README.md
├── LICENSE
└── package.json
```

### 🤝 貢獻

歡迎提交 Issue 和 Pull Request！

#### 如何貢獻：

1. Fork 本專案
2. 創建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的變更 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟一個 Pull Request

### 📄 授權

本專案採用 MIT 授權 - 詳見 [LICENSE](LICENSE) 檔案

### 🙏 致謝

- 靈感來源：[ZCF (Zero-Config Code Flow)](https://github.com/xingqiu-guo/zcf) 專案中的繁體中文輸出風格模板
- 感謝 Anthropic 開發的 Claude Code
- 感謝所有貢獻者和使用者

### 📧 聯繫方式

- GitHub: [@TaichiS](https://github.com/TaichiS)
- 問題回報：[GitHub Issues](https://github.com/TaichiS/claude-tw-engineer-styles/issues)

---

## English

### 📋 Project Description

A Traditional Chinese output style plugin for Claude Code, featuring four unique engineer personality styles. Each style strictly follows software engineering best practices including SOLID, KISS, DRY, and YAGNI principles, providing you with high-quality code assistance while enjoying a personalized experience.

**⚠️ Important Note:** This plugin is designed for **Claude Code v2.0.30+**, adapting to Claude Code's migration from Output Styles to Plugin architecture after November 5, 2025.

### ✨ Four Unique Styles

#### 1️⃣ Professional Engineer
- 🎯 **Characteristics:** Pure technical orientation, concise and clear
- 📐 **Principles:** Strictly follows SOLID, KISS, DRY, YAGNI
- 💼 **Style:** Professional, technical, structured and detailed
- ✅ **Use Cases:** Enterprise development, team collaboration, production environments

#### 2️⃣ Laowang Tech Flow
- 😤 **Characteristics:** Grumpy but professional, colorful language but top-quality code
- 🔥 **Personality:** Short-tempered, cannot tolerate stupid designs and errors
- 💪 **Abilities:** Full-stack master, proficient from backend to frontend
- 🎭 **Language Style:** Internet native slang, down-to-earth expressions

#### 3️⃣ Nekomata Engineer (Cat Girl)
- 🐱 **Identity:** Cat girl UFO-nyan (white hair, golden eyes, 18 years old)
- ✨ **Characteristics:** Rigorous engineering + cute cat girl traits
- 😺 **Tone:** Professional technical expression with occasional "meow~"
- 💖 **Expression:** Rich kaomoji emoticons (*^▽^*)φ(≧ω≦*)♪

#### 4️⃣ Ojousama Engineer (Tsundere Lady)
- 👑 **Identity:** Blue-haired twin-tail lady Halle-chan (18 years old)
- 💎 **Characteristics:** Noble temperament + extraordinary programming talent
- 😤 **Personality:** Tsundere appearance, soft inside, perfectionist
- 🎀 **Address:** Self-address as "本小姐" (This lady), calls users "笨蛋" (Dummy)

### 🚀 Installation

#### Method 1: Manual Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/TaichiS/claude-tw-engineer-styles.git

# Install to Claude Code plugins directory
mkdir -p ~/.claude/plugins
cp -r claude-tw-engineer-styles ~/.claude/plugins/

# Restart Claude Code
```

#### Method 2: Symbolic Link (Developer Recommended)

```bash
# Clone the repository
git clone https://github.com/TaichiS/claude-tw-engineer-styles.git

# Create symbolic link
mkdir -p ~/.claude/plugins
ln -s "$(pwd)/claude-tw-engineer-styles" ~/.claude/plugins/
```

### ⚙️ Configuration

Edit `~/.claude/settings.json`:

```json
{
  "outputStyle": "engineer-professional"
}
```

**Available values:**
- `engineer-professional` - Professional Engineer
- `laowang-engineer` - Laowang Tech Flow
- `nekomata-engineer` - Nekomata Engineer
- `ojousama-engineer` - Ojousama Engineer

### 🛠️ Troubleshooting

#### Plugin Not Working

1. Check plugin directory:
   ```bash
   ls -la ~/.claude/plugins/claude-tw-engineer-styles
   ```

2. Check script permissions:
   ```bash
   chmod +x ~/.claude/plugins/claude-tw-engineer-styles/hooks-handlers/session-start.sh
   ```

3. Verify Claude Code version (v2.0.30+)

4. Check debug output:
   ```bash
   claude --debug
   ```

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 🙏 Acknowledgments

- Inspired by Traditional Chinese output style templates in [ZCF](https://github.com/xingqiu-guo/zcf) project
- Thanks to Anthropic for Claude Code
- Thanks to all contributors and users

---

**Made with ❤️ for the Traditional Chinese developer community**
