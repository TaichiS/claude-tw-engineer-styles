#!/bin/bash

# 任務完成語音通報處理腳本

# 配置文件路徑
CONFIG_DIR="${HOME}/.claude/plugins/claude-tw-engineer-styles"
CONFIG_FILE="${CONFIG_DIR}/notify-config.json"

# 確保配置目錄存在
mkdir -p "${CONFIG_DIR}"

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
      say "好了" &
      ;;
    "full")
      # 完整通報
      if [[ -n "${task_description}" ]]; then
        say "${task_description}的任務，我已經完成了" &
      else
        say "任務已經完成了" &
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
