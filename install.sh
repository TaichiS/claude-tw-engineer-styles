#!/bin/bash

# Claude TW Engineer Styles Plugin - Quick Install Script
# This script automates the installation of the plugin to Claude Code

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Plugin information
PLUGIN_NAME="claude-tw-engineer-styles"
PLUGIN_DIR="${HOME}/.claude/plugins/${PLUGIN_NAME}"

# Function to print colored messages
print_message() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${NC}"
}

# Function to check if Claude Code is installed
check_claude_code() {
  if ! command -v claude &> /dev/null; then
    print_message "$YELLOW" "⚠️  Warning: Claude Code CLI not found in PATH"
    print_message "$YELLOW" "   This is usually fine - the plugin will still work if Claude Code is installed"
  else
    print_message "$GREEN" "✓ Claude Code CLI found"
  fi
}

# Function to create plugins directory
create_plugins_dir() {
  if [[ ! -d "${HOME}/.claude/plugins" ]]; then
    print_message "$BLUE" "📁 Creating plugins directory..."
    mkdir -p "${HOME}/.claude/plugins"
  fi
}

# Function to backup existing plugin
backup_existing() {
  if [[ -d "${PLUGIN_DIR}" ]]; then
    local backup_dir="${PLUGIN_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    print_message "$YELLOW" "⚠️  Existing plugin found. Creating backup..."
    mv "${PLUGIN_DIR}" "${backup_dir}"
    print_message "$GREEN" "✓ Backup created: ${backup_dir}"
  fi
}

# Function to install plugin
install_plugin() {
  print_message "$BLUE" "📦 Installing plugin..."

  # Copy plugin files
  cp -r "$(dirname "$0")" "${PLUGIN_DIR}"

  # Set executable permission for hook handler
  chmod +x "${PLUGIN_DIR}/hooks-handlers/session-start.sh"

  print_message "$GREEN" "✓ Plugin installed successfully!"
}

# Function to check settings.json
check_settings() {
  local settings_file="${HOME}/.claude/settings.json"

  if [[ ! -f "${settings_file}" ]]; then
    print_message "$YELLOW" "⚠️  settings.json not found"
    print_message "$BLUE" "   Creating default settings.json..."
    echo '{"outputStyle": "engineer-professional"}' > "${settings_file}"
    print_message "$GREEN" "✓ Default settings created"
  else
    # Check if outputStyle is configured
    if grep -q '"outputStyle"' "${settings_file}"; then
      local current_style=$(grep -o '"outputStyle"[[:space:]]*:[[:space:]]*"[^"]*"' "${settings_file}" | sed 's/.*"outputStyle"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
      print_message "$GREEN" "✓ Current output style: ${current_style}"
    else
      print_message "$YELLOW" "⚠️  No outputStyle configured in settings.json"
      print_message "$BLUE" "   Add this to your settings.json to enable:"
      print_message "$BLUE" '   "outputStyle": "engineer-professional"'
    fi
  fi
}

# Function to display available styles
display_styles() {
  print_message "$BLUE" "\n📚 Available Styles:"
  echo ""
  print_message "$GREEN" "  1. engineer-professional  - 專業工程師"
  print_message "$GREEN" "  2. laowang-engineer       - 老王技術流"
  print_message "$GREEN" "  3. nekomata-engineer      - 貓娘工程師"
  print_message "$GREEN" "  4. ojousama-engineer      - 傲嬌大小姐工程師"
  echo ""
}

# Main installation flow
main() {
  print_message "$BLUE" "╔════════════════════════════════════════════════════════╗"
  print_message "$BLUE" "║  Claude TW Engineer Styles Plugin - Installer v1.0.0  ║"
  print_message "$BLUE" "╚════════════════════════════════════════════════════════╝"
  echo ""

  # Check Claude Code
  check_claude_code
  echo ""

  # Create plugins directory
  create_plugins_dir

  # Backup existing installation
  backup_existing

  # Install plugin
  install_plugin
  echo ""

  # Check settings
  check_settings
  echo ""

  # Display available styles
  display_styles

  # Final instructions
  print_message "$GREEN" "╔════════════════════════════════════════════════════════╗"
  print_message "$GREEN" "║  Installation Complete! 🎉                             ║"
  print_message "$GREEN" "╚════════════════════════════════════════════════════════╝"
  echo ""
  print_message "$BLUE" "Next Steps:"
  print_message "$BLUE" "  1. Configure your preferred style in ~/.claude/settings.json"
  print_message "$BLUE" "  2. Restart Claude Code"
  print_message "$BLUE" "  3. Enjoy your personalized coding assistant!"
  echo ""
  print_message "$BLUE" "Documentation: https://github.com/Loongwoo/claude-tw-engineer-styles"
  echo ""
}

# Run main function
main
