#!/bin/bash

# Claude TW Engineer Styles - Session Start Hook Handler
# This script injects the selected Traditional Chinese engineer output style at session start

# Get the plugin root directory
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
STYLES_DIR="${PLUGIN_ROOT}/styles"

# Default style if not configured
DEFAULT_STYLE="engineer-professional"

# Supported styles
SUPPORTED_STYLES=("engineer-professional" "laowang-engineer" "nekomata-engineer" "ojousama-engineer")

# Function to get configured output style from Claude settings
get_configured_style() {
  local settings_file="${HOME}/.claude/settings.json"

  if [[ -f "${settings_file}" ]]; then
    # Try to extract outputStyle from settings.json using grep and sed
    local configured_style=$(grep -o '"outputStyle"[[:space:]]*:[[:space:]]*"[^"]*"' "${settings_file}" 2>/dev/null | sed 's/.*"outputStyle"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')

    # Check if the configured style is supported
    for style in "${SUPPORTED_STYLES[@]}"; do
      if [[ "${style}" == "${configured_style}" ]]; then
        echo "${configured_style}"
        return 0
      fi
    done
  fi

  # Return default if not found or not supported
  echo "${DEFAULT_STYLE}"
}

# Function to read style content from markdown file
read_style_content() {
  local style_name="$1"
  local style_file="${STYLES_DIR}/${style_name}.md"

  if [[ -f "${style_file}" ]]; then
    # Read the entire file content
    cat "${style_file}"
  else
    # Fallback message if file not found
    echo "# 繁體中文工程師輸出風格

請使用專業、嚴謹的工程師風格進行回應，遵循 SOLID、KISS、DRY、YAGNI 原則。"
  fi
}

# Function to escape content for JSON
json_escape() {
  local content="$1"
  # Escape backslashes, quotes, newlines, tabs, and other special characters
  echo -n "$content" | python3 -c 'import json, sys; print(json.dumps(sys.stdin.read()))'
}

# Main execution
main() {
  # Get the configured or default style
  local selected_style=$(get_configured_style)

  # Read the style content
  local style_content=$(read_style_content "${selected_style}")

  # Escape the content for JSON
  local escaped_content=$(json_escape "${style_content}")

  # Output the hook result as JSON
  cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": ${escaped_content}
  }
}
EOF
}

# Run main function
main

# Exit successfully
exit 0
