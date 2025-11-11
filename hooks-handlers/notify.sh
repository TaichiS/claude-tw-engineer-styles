#!/bin/bash

# 任務完成語音通報處理腳本

# 配置文件路徑
CONFIG_DIR="${HOME}/.claude/plugins/claude-tw-engineer-styles"
CONFIG_FILE="${CONFIG_DIR}/notify-config.json"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 確保配置目錄存在
mkdir -p "${CONFIG_DIR}"

# 偵測作業系統
detect_os() {
  case "$(uname -s)" in
    Darwin*)
      echo "macos"
      ;;
    Linux*)
      echo "linux"
      ;;
    CYGWIN*|MINGW*|MSYS*)
      echo "windows"
      ;;
    *)
      echo "unknown"
      ;;
  esac
}

# 跨平台語音合成函數
speak() {
  local text="$1"
  local os_type=$(detect_os)

  case "${os_type}" in
    "macos")
      # macOS 使用內建 say 指令
      say "${text}" &
      ;;
    "linux")
      # Linux 優先使用 espeak，若無則使用 festival
      if command -v espeak >/dev/null 2>&1; then
        espeak -v zh "${text}" &
      elif command -v festival >/dev/null 2>&1; then
        echo "${text}" | festival --tts &
      else
        echo "⚠️  警告：未找到語音合成工具（espeak 或 festival）" >&2
        return 1
      fi
      ;;
    "windows")
      # Windows 使用 PowerShell 腳本
      if command -v pwsh >/dev/null 2>&1; then
        # 使用 PowerShell Core
        pwsh -NoProfile -ExecutionPolicy Bypass -File "${SCRIPT_DIR}/say.ps1" "${text}" &
      elif command -v powershell >/dev/null 2>&1; then
        # 使用 Windows PowerShell
        powershell -NoProfile -ExecutionPolicy Bypass -File "${SCRIPT_DIR}/say.ps1" "${text}" &
      else
        echo "⚠️  警告：未找到 PowerShell" >&2
        return 1
      fi
      ;;
    *)
      echo "⚠️  警告：不支援的作業系統" >&2
      return 1
      ;;
  esac
}

# 初始化配置文件（如果不存在）
init_config() {
  if [[ ! -f "${CONFIG_FILE}" ]]; then
    cat > "${CONFIG_FILE}" <<EOF
{
  "mode": "off",
  "last_task": ""
}
EOF
  fi
}

# 讀取配置
get_config() {
  init_config
  local key="$1"
  grep -o "\"${key}\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" "${CONFIG_FILE}" | sed "s/.*\"${key}\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/"
}

# 更新配置
set_config() {
  init_config
  local key="$1"
  local value="$2"

  # 使用臨時文件更新配置
  local temp_file="${CONFIG_FILE}.tmp"

  if grep -q "\"${key}\"" "${CONFIG_FILE}"; then
    # 更新現有鍵值
    sed "s/\"${key}\"[[:space:]]*:[[:space:]]*\"[^\"]*\"/\"${key}\": \"${value}\"/" "${CONFIG_FILE}" > "${temp_file}"
  else
    # 添加新鍵值（在最後一個 } 之前）
    sed "s/}/  \"${key}\": \"${value}\"\n}/" "${CONFIG_FILE}" > "${temp_file}"
  fi

  mv "${temp_file}" "${CONFIG_FILE}"
}

# 執行語音通報
notify() {
  local mode=$(get_config "mode")
  local task_description="$1"

  case "${mode}" in
    "off")
      # 不通報
      return 0
      ;;
    "simple")
      # 簡單通報
      speak "好了"
      ;;
    "full")
      # 完整通報
      if [[ -n "${task_description}" ]]; then
        speak "${task_description}的任務，我已經完成了"
      else
        speak "任務已經完成了"
      fi
      ;;
    *)
      # 預設不通報
      return 0
      ;;
  esac
}

# 主函數
main() {
  local command="$1"
  local task_description="$2"

  case "${command}" in
    "set-mode")
      # 設定通報模式
      local new_mode="$2"
      set_config "mode" "${new_mode}"
      echo "✅ 通報模式已設定為：${new_mode}"
      ;;
    "get-mode")
      # 取得目前模式
      local current_mode=$(get_config "mode")
      echo "目前通報模式：${current_mode}"
      ;;
    "notify")
      # 執行通報
      notify "${task_description}"
      ;;
    "save-task")
      # 儲存任務描述
      set_config "last_task" "${task_description}"
      ;;
    *)
      echo "未知命令：${command}"
      echo "可用命令：set-mode, get-mode, notify, save-task"
      exit 1
      ;;
  esac
}

# 執行主函數
main "$@"
