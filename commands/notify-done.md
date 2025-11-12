---
description: 手動觸發任務完成語音通報
---

# 任務完成通報

**使用方式：** `/notify-done [任務描述]`

此命令會根據您設定的通報模式進行語音通報：

**通報模式說明：**

1. **關閉模式** (`/notify-off`)
   - 不會有任何通報

2. **簡單模式** (`/notify-simple`)
   - 系統會說：「好了」
   - 適合需要簡單提醒的場景

3. **完整模式** (`/notify-full`)
   - 系統會說：「[任務描述] 的任務，我已經完成了」
   - 適合需要知道具體完成內容的場景

**使用範例：**

```bash
# 簡單通報（需先執行 /notify-simple）
/notify-done 修復 bug

# 完整通報（需先執行 /notify-full）
/notify-done 重構使用者認證模組
→ 系統會說：「重構使用者認證模組的任務，我已經完成了」

/notify-done 完成 API 文件
→ 系統會說：「完成 API 文件的任務，我已經完成了」
```

**注意事項：**
- 此功能使用系統內建的 `say` 指令
- 在 macOS 上效果最佳
- Linux 系統可能需要安裝 `espeak` 或 `festival`
- Windows 系統不支援此功能

**相關命令：**
- `/notify-status` - 查看目前設定
- `/notify-off` - 關閉通報
- `/notify-simple` - 設定為簡單模式
- `/notify-full` - 設定為完整模式
