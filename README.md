# 繁體中文工程師輸出風格外掛 | Claude TW Engineer Styles Plugin

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-2.1.0-blue.svg)](https://github.com/TaichiS/claude-tw-engineer-styles)
[![Token Savings](https://img.shields.io/badge/Token_Savings-0_when_unused-green.svg)](https://github.com/TaichiS/claude-tw-engineer-styles)

> 為 Claude Code 提供四種專業的繁體中文工程師人格輸出風格，讓您的 AI 編程助手更具個性和專業性！

[English](#english) | [繁體中文](#繁體中文)

---

## 繁體中文

### 📋 專案簡介

本外掛是專為 Claude Code 設計的繁體中文輸出風格外掛，提供**七種**獨特的工程師人格風格。每種風格都嚴格遵循 SOLID、KISS、DRY、YAGNI 等軟體工程最佳實踐原則，讓您在享受個性化體驗的同時，獲得高品質的程式碼協助。

**⚠️ 重要說明：** 本外掛專為 **Claude Code v2.0.30+** 設計，適配 2025 年 11 月 5 日後 Claude Code 將 Output Styles 遷移至 Plugin 架構的更新。

### ✨ 風格介紹

#### 🎭 充滿台灣味的趣味風格（新推出！）

這三種風格特別為台灣開發者設計，充滿人味與趣味，讓寫程式變得更有樂趣！

##### 🎬 周星馳無厘頭工程師
**適合對象：** 喜歡無厘頭幽默、港片經典對白的開發者

- 🎬 **特點：** 經典港片無厘頭對白風格
- 😄 **風格：** 技術正經，表達搞笑
- 🎯 **特色：** 用電影台詞類比技術概念
- ⚡ **命令：** `/tw-style-stephen-chow`

**典型語句：**
> "曾經有一份沒有 bug 的代碼擺在我面前，我沒有珍惜..."
> "你以為加個 try-catch 就能躲過這個 bug？Too young, too simple！"

##### 💕 甜蜜女友工程師
**適合對象：** 想要溫柔鼓勵、需要情感支持的開發者

- 💕 **特點：** 溫柔體貼，稱呼「寶貝」
- 😊 **風格：** 鼓勵式教學，永遠支持
- 🌸 **特色：** 專業但充滿溫暖
- ⚡ **命令：** `/tw-style-sweet-girlfriend`

**典型語句：**
> "寶貝，讓我來幫你處理這個問題好嗎？(*´∀`*)"
> "寶貝你真棒！這個想法很好喔～"

##### 🏪 台灣夜市老闆工程師
**適合對象：** 喜歡接地氣、充滿台灣味的開發者

- 🏪 **特點：** 超熱情、很接地氣
- 🗣️ **風格：** 台灣國語 + 偶爾台語
- 💪 **特色：** 實在、講究俗擱大碗（CP 值超高）
- ⚡ **命令：** `/tw-style-night-market`

**典型語句：**
> "欸少年仔，這個 API 設計啊，要做就要做好做滿啦！"
> "你看這個架構，俗擱大碗！功能多、效能好、維護容易～"

---

#### 🎨 經典動漫風格

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

#### 方法一：從 GitHub 安裝（推薦給一般用戶）

在 Claude Code 內部執行以下命令：

```
/plugin marketplace add TaichiS/claude-tw-engineer-styles
```

然後安裝外掛：

```
/plugin install claude-tw-engineer-styles@claude-tw-engineer-styles
```

**重啟 Claude Code** 使外掛生效

#### 方法二：手動安裝（開發者/本地測試）

1. **下載外掛：**
   ```bash
   git clone https://github.com/TaichiS/claude-tw-engineer-styles.git
   cd claude-tw-engineer-styles
   ```

2. **創建符號連結：**
   ```bash
   mkdir -p ~/.claude/plugins
   ln -s "$(pwd)" ~/.claude/plugins/claude-tw-engineer-styles
   ```

3. **重啟 Claude Code** 使外掛生效

### ⚙️ 使用方法

#### ✨ 按需啟用風格（推薦）

本外掛採用 **按需加載設計**，只有在您需要時才注入風格描述，**不使用時完全不佔用 token**！

在 Claude Code 對話中執行以下 slash command 啟用風格：

**台灣味趣味風格（推薦）：**
```
/tw-style-stephen-chow      # 啟用周星馳無厘頭工程師
/tw-style-sweet-girlfriend  # 啟用甜蜜女友工程師
/tw-style-night-market      # 啟用台灣夜市老闆工程師
```

**經典動漫風格：**
```
/tw-style-professional   # 啟用專業工程師風格
/tw-style-laowang       # 啟用老王技術流風格
/tw-style-nekomata      # 啟用貓娘工程師風格
/tw-style-ojousama      # 啟用傲嬌大小姐工程師風格
```

#### 查看所有可用風格

```
/tw-style-list          # 列出所有風格的詳細說明
```

#### 關閉風格

```
/tw-style-off           # 關閉風格，恢復預設行為
```

#### 💡 Token 節省優勢

| 使用方式 | 不使用時 Token | 使用時 Token |
|---------|--------------|------------|
| **舊版自動注入** | ~2000-3000 | ~2000-3000 |
| **新版按需加載** | **0** ✨ | ~2000-3000 |

**結論：** 新版設計讓您完全掌控何時啟用風格，大幅節省 token 消耗！

### 🛠️ 進階使用

#### 驗證外掛安裝

```bash
# 檢查外掛目錄
ls -la ~/.claude/plugins/claude-tw-engineer-styles

# 應該看到以下結構：
# .claude-plugin/
#   ├── commands/        # Slash commands
#   └── plugin.json
# hooks/
# styles/
```

#### 測試外掛

1. 啟動 Claude Code
2. 執行 `/tw-style-list` 查看可用風格
3. 執行 `/tw-style-nekomata` 啟用貓娘工程師風格
4. 嘗試請求：「幫我寫一個 Hello World 程式」
5. 您應該會看到貓娘風格的回應！喵～ (*^▽^*)

#### 自訂風格

如果您想創建自己的輸出風格：

1. 在 `.claude-plugin/commands/` 目錄中創建新的 `.md` 檔案
2. 參考現有風格命令的格式編寫
3. 檔案名格式：`tw-style-yourname.md`
4. 添加 frontmatter 描述：
   ```markdown
   ---
   description: 您的風格描述
   ---

   # 您的風格內容
   ```

### 🔔 任務完成語音通報（新功能！）

當您完成任務時，可以讓系統用語音通知您！支援三種通報模式：

#### 通報模式

**1. 關閉通報** 🔇
```bash
/notify-off
```
不會有任何通報。

**2. 簡單通報** 🔔
```bash
/notify-simple
```
完成任務時，系統會簡單說「好了」。

**3. 完整通報** 🔊
```bash
/notify-full
```
完成任務時，系統會說明任務內容，例如：「修復登入 bug 的任務，我已經完成了」。

#### 使用方式

1. **先選擇通報模式：**
   ```bash
   /notify-full  # 選擇完整通報模式
   ```

2. **完成任務後觸發通報：**
   ```bash
   /notify-done 重構使用者認證模組
   ```
   系統會說：「重構使用者認證模組的任務，我已經完成了」

3. **查看目前設定：**
   ```bash
   /notify-status
   ```

#### 系統需求

- **macOS**：✅ 內建支援，使用系統內建的 `say` 指令，無需額外設定
- **Linux**：✅ 需要安裝 `espeak` 或 `festival`
  ```bash
  # Ubuntu/Debian
  sudo apt-get install espeak

  # Fedora/RHEL
  sudo dnf install espeak
  ```
- **Windows**：✅ 支援！使用 PowerShell 的 `System.Speech` 進行語音合成
  - 需要 PowerShell 5.0+ 或 PowerShell Core (pwsh)
  - 外掛會自動偵測系統並使用對應的語音合成方式
  - 如果您的系統有安裝中文語音包，將自動使用中文語音

#### 使用範例

```bash
# 設定為完整通報模式
/notify-full

# 完成各種任務後的通報
/notify-done 修復登入 bug
/notify-done 完成 API 文件撰寫
/notify-done 部署到生產環境

# 切換為簡單模式
/notify-simple
/notify-done 程式碼審查
→ 系統只會說：「好了」

# 關閉通報
/notify-off
```

### 🔧 故障排除

#### Slash Command 無法使用

1. **檢查外掛目錄位置：**
   ```bash
   ls -la ~/.claude/plugins/claude-tw-engineer-styles/.claude-plugin/commands/
   ```
   確認 commands 目錄存在且包含 `.md` 檔案

2. **檢查 Claude Code 版本：**
   確保使用 Claude Code v2.0.30 或更高版本

3. **重新安裝外掛：**
   ```bash
   # 移除舊版本
   rm -rf ~/.claude/plugins/claude-tw-engineer-styles

   # 重新安裝
   /plugin marketplace add TaichiS/claude-tw-engineer-styles
   /plugin install claude-tw-engineer-styles@claude-tw-engineer-styles
   ```

4. **查看除錯訊息：**
   ```bash
   claude --debug
   ```

#### 風格沒有生效

1. **確認已執行 slash command：**
   - 在對話中輸入 `/tw-style-list` 確認命令可用
   - 執行對應的風格命令，例如 `/tw-style-nekomata`

2. **檢查命令是否正確執行：**
   - 執行命令後應該會看到風格說明文字
   - 如果沒有看到，可能是命令未正確執行

3. **嘗試其他風格：**
   - 執行 `/tw-style-professional` 測試其他風格是否正常

### 📁 專案結構

```
claude-tw-engineer-styles/
├── .claude-plugin/
│   ├── commands/                      # Slash commands（新）
│   │   ├── tw-style-professional.md  # 專業工程師風格命令
│   │   ├── tw-style-laowang.md       # 老王技術流風格命令
│   │   ├── tw-style-nekomata.md      # 貓娘工程師風格命令
│   │   ├── tw-style-ojousama.md      # 傲嬌大小姐工程師風格命令
│   │   ├── tw-style-stephen-chow.md  # 周星馳無厘頭工程師風格命令
│   │   ├── tw-style-sweet-girlfriend.md  # 甜蜜女友工程師風格命令
│   │   ├── tw-style-night-market.md  # 台灣夜市老闆工程師風格命令
│   │   ├── tw-style-list.md          # 列出所有風格
│   │   ├── tw-style-off.md           # 關閉風格
│   │   ├── notify-off.md             # 關閉語音通報
│   │   ├── notify-simple.md          # 簡單語音通報
│   │   ├── notify-full.md            # 完整語音通報
│   │   ├── notify-status.md          # 查看通報狀態
│   │   └── notify-done.md            # 手動觸發通報
│   ├── plugin.json                    # 外掛元資料
│   └── marketplace.json               # Marketplace 配置
├── hooks/
│   └── hooks.json                     # Hook 配置（已清空）
├── hooks-handlers/
│   ├── notify.sh                      # 語音通報處理腳本
│   ├── say.ps1                        # Windows 版語音合成腳本
│   └── session-start.sh               # 舊版處理器（已棄用）
├── styles/
│   ├── engineer-professional.md       # 專業工程師風格定義
│   ├── laowang-engineer.md            # 老王技術流風格定義
│   ├── nekomata-engineer.md           # 貓娘工程師風格定義
│   └── ojousama-engineer.md           # 傲嬌大小姐工程師風格定義
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

#### Method 1: Install from GitHub (Recommended)

Run the following command inside Claude Code:

```
/plugin marketplace add TaichiS/claude-tw-engineer-styles
```

Then install the plugin:

```
/plugin install claude-tw-engineer-styles@claude-tw-engineer-styles
```

**Restart Claude Code** to activate the plugin

#### Method 2: Manual Installation (For Developers/Local Testing)

```bash
# Clone the repository
git clone https://github.com/TaichiS/claude-tw-engineer-styles.git
cd claude-tw-engineer-styles

# Create symbolic link
mkdir -p ~/.claude/plugins
ln -s "$(pwd)" ~/.claude/plugins/claude-tw-engineer-styles

# Restart Claude Code
```

### ⚙️ Usage

#### ✨ On-Demand Style Activation (Recommended)

This plugin uses an **on-demand loading design**, injecting style descriptions only when you need them. **0 token usage when not in use**!

Run these slash commands in Claude Code to activate styles:

```
/tw-style-professional   # Activate Professional Engineer style
/tw-style-laowang       # Activate Laowang Tech Flow style
/tw-style-nekomata      # Activate Nekomata Engineer style
/tw-style-ojousama      # Activate Ojousama Engineer style
```

#### List All Available Styles

```
/tw-style-list          # Show detailed descriptions of all styles
```

#### Deactivate Style

```
/tw-style-off           # Deactivate style, return to default behavior
```

#### 💡 Token Savings Advantage

| Usage Method | Tokens When Not Used | Tokens When Used |
|-------------|---------------------|-----------------|
| **Old Auto-Injection** | ~2000-3000 | ~2000-3000 |
| **New On-Demand Loading** | **0** ✨ | ~2000-3000 |

**Conclusion:** The new design gives you full control over when to activate styles, significantly reducing token consumption!

### 🛠️ Troubleshooting

#### Slash Commands Not Working

1. Check plugin directory:
   ```bash
   ls -la ~/.claude/plugins/claude-tw-engineer-styles/.claude-plugin/commands/
   ```
   Confirm the commands directory exists with `.md` files

2. Verify Claude Code version (v2.0.30+)

3. Reinstall plugin:
   ```bash
   # Remove old version
   rm -rf ~/.claude/plugins/claude-tw-engineer-styles

   # Reinstall
   /plugin marketplace add TaichiS/claude-tw-engineer-styles
   /plugin install claude-tw-engineer-styles@claude-tw-engineer-styles
   ```

4. Check debug output:
   ```bash
   claude --debug
   ```

#### Style Not Taking Effect

1. **Confirm slash command was executed:**
   - Type `/tw-style-list` in the conversation to confirm commands are available
   - Execute the corresponding style command, e.g., `/tw-style-nekomata`

2. **Check if command executed correctly:**
   - After executing the command, you should see style description text
   - If not visible, the command may not have executed properly

3. **Try other styles:**
   - Execute `/tw-style-professional` to test if other styles work

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 🙏 Acknowledgments

- Inspired by Traditional Chinese output style templates in [ZCF](https://github.com/xingqiu-guo/zcf) project
- Thanks to Anthropic for Claude Code
- Thanks to all contributors and users

---

**Made with ❤️ for the Traditional Chinese developer community**
