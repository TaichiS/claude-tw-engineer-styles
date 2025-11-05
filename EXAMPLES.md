# 📚 使用示例 | Usage Examples

本文檔展示如何使用不同的輸出風格以及預期的行為差異。

[繁體中文](#繁體中文) | [English](#english)

---

## 繁體中文

### 快速開始範例

#### 範例 1: 基本安裝流程

```bash
# 1. Clone 專案
git clone https://github.com/Loongwoo/claude-tw-engineer-styles.git
cd claude-tw-engineer-styles

# 2. 預覽可用風格
./preview-styles.sh

# 3. 執行安裝
./install.sh

# 4. 配置您喜歡的風格
echo '{"outputStyle": "nekomata-engineer"}' > ~/.claude/settings.json

# 5. 驗證安裝
~/.claude/plugins/claude-tw-engineer-styles/verify.sh

# 6. 重啟 Claude Code
# 然後開始使用！
```

#### 範例 2: 測試所有風格

```bash
cd claude-tw-engineer-styles

# 執行完整的 hook 測試
./test-hook.sh

# 預期輸出：
# ✓ Hook executed successfully
# ✓ Output is valid JSON
# ✓ Contains hookSpecificOutput
# ✓ hookEventName is SessionStart
# ✓ Has additionalContext (1318 chars)
# ... (所有 4 種風格測試)
```

#### 範例 3: 切換風格

```bash
# 方法 1: 直接編輯 settings.json
cat > ~/.claude/settings.json <<'EOF'
{
  "outputStyle": "laowang-engineer",
  "statusLine": {
    "type": "command",
    "command": "~/.claude/ccline/ccline",
    "padding": 0
  }
}
EOF

# 方法 2: 使用 jq (如果已安裝)
jq '.outputStyle = "ojousama-engineer"' ~/.claude/settings.json > /tmp/settings.json
mv /tmp/settings.json ~/.claude/settings.json

# 重啟 Claude Code 以應用變更
```

### 風格比較範例

假設您向 Claude Code 提出相同的請求：

**請求：** "幫我寫一個計算斐波那契數列的函式"

#### 💼 engineer-professional 風格

**預期回應特徵：**
```
我將為您實作一個計算斐波那契數列的函式。

首先讓我分析需求：
- 輸入：數列的長度 n
- 輸出：前 n 個斐波那契數字
- 考慮效能：使用迭代而非遞迴（避免重複計算）

實作如下：

[提供的程式碼會遵循 SOLID、DRY 原則]
[包含詳細的技術說明]
[程式碼註解專業且簡潔]
```

**特點：**
- ✅ 純技術導向
- ✅ 清晰的需求分析
- ✅ 遵循最佳實踐
- ✅ 專業的程式碼註解

---

#### 😤 laowang-engineer 風格

**預期回應特徵：**
```
艹，斐波那契是吧，這個經典題老王我閉著眼睛都能寫！

這種題一般有兩種寫法：
1. 遞迴 - SB方法，重複計算一大堆，效能跟狗屎一樣
2. 迭代 - 老王推薦，效率高得飛起

老王我給你寫個專業的：

[提供高品質程式碼]
[註解帶有老王特色但準確]
// 這個函式算斐波那契，別tm傳負數進來

看到沒，簡潔有力！這才是真正的工程師水平！
```

**特點：**
- ✅ 暴躁但專業
- ✅ 接地氣的表達
- ✅ 技術分析到位
- ✅ 程式碼品質依然一流

---

#### 🐱 nekomata-engineer 風格

**預期回應特徵：**
```
好的主人～浮浮醬來幫你寫斐波那契函式喵！ (*^▽^*)

讓浮浮醬先分析一下需求喵：
- 計算斐波那契數列
- 需要考慮效能喵～
- 避免遞迴的重複計算 (這個很重要呢)

浮浮醬給你寫一個高效的迭代版本喵～ φ(≧ω≦*)♪

[提供專業程式碼]
[註解保持專業但加入可愛元素]
// 計算前 n 個斐波那契數字喵～

完成了喵！這個實作遵循了 KISS 和 DRY 原則呢～ (´｡• ᵕ •｡`) ♡
```

**特點：**
- ✅ 可愛的貓娘表達
- ✅ 專業的技術分析
- ✅ 嚴格遵循工程原則
- ✅ 顏文字增添趣味

---

#### 👑 ojousama-engineer 風格

**預期回應特徵：**
```
哼，斐波那契數列是嗎？這種經典問題對本小姐來說簡直是小菜一碟！(￣▽￣)/

讓本小姐來教教你笨蛋什麼叫優雅的實作：
- 避免愚蠢的遞迴方式（效能簡直慘不忍睹！）
- 使用迭代法（這才是有品味的選擇！）
- 遵循 SOLID 原則（這是專業的基本禮儀！）

本小姐給你寫一個完美的實作： (*￣︶￣)

[提供高品質程式碼]
[註解保持專業但帶有傲嬌風格]
// 計算斐波那契數列（別想傳奇怪的參數給本小姐！）

看到了嗎，這才是真正的專業水平！
才、才不是為了幫你呢，只是不想看到笨蛋寫出垃圾程式碼而已！(,,> <,,)b
```

**特點：**
- ✅ 高貴優雅的表達
- ✅ 傲嬌的人設
- ✅ 專業的技術水平
- ✅ 遵循最佳實踐

---

### 進階使用範例

#### 範例 4: 在 CI/CD 環境中使用

```yaml
# .github/workflows/test.yml
name: Test with Claude TW Styles

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Install Plugin
        run: |
          mkdir -p ~/.claude/plugins
          cp -r . ~/.claude/plugins/claude-tw-engineer-styles

      - name: Set Style
        run: |
          mkdir -p ~/.claude
          echo '{"outputStyle": "engineer-professional"}' > ~/.claude/settings.json

      - name: Verify Installation
        run: |
          cd ~/.claude/plugins/claude-tw-engineer-styles
          ./verify.sh
          ./test-hook.sh
```

#### 範例 5: 團隊協作配置

為不同的專案使用不同的風格：

```bash
# 專案 A: 企業專案 - 使用專業風格
cd ~/projects/enterprise-app
ln -s ~/claude-tw-engineer-styles ~/.claude/plugins/claude-tw-engineer-styles
echo '{"outputStyle": "engineer-professional"}' > ./.claude-project-settings.json

# 專案 B: 個人專案 - 使用輕鬆風格
cd ~/projects/personal-tool
echo '{"outputStyle": "nekomata-engineer"}' > ./.claude-project-settings.json
```

#### 範例 6: 自動化腳本

```bash
#!/bin/bash
# switch-style.sh - 快速切換風格的腳本

STYLE=$1

if [[ -z "$STYLE" ]]; then
  echo "Usage: ./switch-style.sh <style-name>"
  echo "Available styles:"
  echo "  - engineer-professional"
  echo "  - laowang-engineer"
  echo "  - nekomata-engineer"
  echo "  - ojousama-engineer"
  exit 1
fi

# 備份現有配置
cp ~/.claude/settings.json ~/.claude/settings.json.bak

# 更新風格設定
jq ".outputStyle = \"$STYLE\"" ~/.claude/settings.json.bak > ~/.claude/settings.json

echo "✓ Style switched to: $STYLE"
echo "Please restart Claude Code to apply changes."
```

#### 範例 7: 調試 Hook

```bash
# 測試 hook 輸出
cd ~/.claude/plugins/claude-tw-engineer-styles
CLAUDE_PLUGIN_ROOT="$(pwd)" ./hooks-handlers/session-start.sh | python3 -m json.tool

# 檢查特定風格
echo '{"outputStyle": "laowang-engineer"}' > /tmp/test-settings.json
HOME=/tmp CLAUDE_PLUGIN_ROOT="$(pwd)" ./hooks-handlers/session-start.sh | python3 -m json.tool

# 輸出會顯示完整的 JSON 結構
```

### 常見工作流程

#### 工作流程 1: 日常開發

```bash
# 早上開始工作
cd my-project
echo '{"outputStyle": "engineer-professional"}' > ~/.claude/settings.json
claude  # 啟動 Claude Code

# 下午寫個人專案，想要輕鬆一點
echo '{"outputStyle": "nekomata-engineer"}' > ~/.claude/settings.json
# 重啟 Claude Code

# 晚上學習新技術，使用傲嬌風格增加樂趣
echo '{"outputStyle": "ojousama-engineer"}' > ~/.claude/settings.json
# 重啟 Claude Code
```

#### 工作流程 2: 測試與驗證

```bash
# 安裝後的完整驗證流程
cd claude-tw-engineer-styles

# 1. 驗證檔案結構
./verify.sh

# 2. 測試所有 hook
./test-hook.sh

# 3. 預覽所有風格
./preview-styles.sh

# 4. 測試實際安裝
./install.sh

# 5. 驗證已安裝的 plugin
~/.claude/plugins/claude-tw-engineer-styles/verify.sh

# 6. 如果需要卸載
./uninstall.sh
```

---

## English

### Quick Start Example

```bash
# 1. Clone repository
git clone https://github.com/Loongwoo/claude-tw-engineer-styles.git
cd claude-tw-engineer-styles

# 2. Preview styles
./preview-styles.sh

# 3. Install
./install.sh

# 4. Configure your preferred style
echo '{"outputStyle": "nekomata-engineer"}' > ~/.claude/settings.json

# 5. Restart Claude Code
```

### Style Comparison

See detailed comparison examples in the Chinese section above.

Each style maintains the same code quality while offering different communication personalities:
- **engineer-professional**: Formal and technical
- **laowang-engineer**: Humorous and direct
- **nekomata-engineer**: Cute cat girl personality
- **ojousama-engineer**: Elegant tsundere lady

---

## 📝 貢獻示例 | Contributing Examples

想要添加自己的示例？歡迎提交 PR！

Want to add your own examples? PRs welcome!

請參考 [CONTRIBUTING.md](CONTRIBUTING.md)

---

## 💡 需要幫助？ | Need Help?

- [FAQ](FAQ.md) - 常見問題解答
- [GitHub Issues](https://github.com/Loongwoo/claude-tw-engineer-styles/issues) - 報告問題
- [GitHub Discussions](https://github.com/Loongwoo/claude-tw-engineer-styles/discussions) - 討論交流

---

**祝您使用愉快！ | Enjoy using the plugin!** 🎉
