#!/bin/bash

# Claude TW Engineer Styles Plugin - Uninstaller
# This script safely removes the plugin from Claude Code

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_message() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${NC}"
}

# Plugin information
PLUGIN_NAME="claude-tw-engineer-styles"
PLUGIN_DIR="${HOME}/.claude/plugins/${PLUGIN_NAME}"

# Header
print_message "$BLUE" "╔════════════════════════════════════════════════════════╗"
print_message "$BLUE" "║  Claude TW Engineer Styles Plugin - Uninstaller       ║"
print_message "$BLUE" "╚════════════════════════════════════════════════════════╝"
echo ""

# Check if plugin is installed
if [[ ! -d "${PLUGIN_DIR}" ]]; then
  print_message "$YELLOW" "⚠️  Plugin is not installed at ${PLUGIN_DIR}"
  print_message "$BLUE" "Nothing to uninstall."
  exit 0
fi

# Show what will be removed
print_message "$YELLOW" "⚠️  The following will be removed:"
echo ""
print_message "$BLUE" "  Plugin directory: ${PLUGIN_DIR}"
if [[ -d "${PLUGIN_DIR}" ]]; then
  print_message "$BLUE" "  Total size: $(du -sh "${PLUGIN_DIR}" | cut -f1)"
fi
echo ""

# Confirmation prompt
print_message "$YELLOW" "⚠️  This action cannot be undone!"
echo ""
read -p "Are you sure you want to uninstall? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy]es$ ]]; then
  print_message "$BLUE" "Uninstallation cancelled."
  exit 0
fi

# Create backup before removal (optional)
print_message "$BLUE" "📦 Creating backup..."
BACKUP_DIR="${HOME}/.claude/plugins/.backup"
BACKUP_FILE="${BACKUP_DIR}/${PLUGIN_NAME}.$(date +%Y%m%d_%H%M%S).tar.gz"

mkdir -p "${BACKUP_DIR}"
tar -czf "${BACKUP_FILE}" -C "${HOME}/.claude/plugins" "${PLUGIN_NAME}" 2>/dev/null

if [[ -f "${BACKUP_FILE}" ]]; then
  print_message "$GREEN" "✓ Backup created: ${BACKUP_FILE}"
else
  print_message "$YELLOW" "⚠️  Backup creation failed (continuing anyway)"
fi

# Remove plugin directory
print_message "$BLUE" "🗑️  Removing plugin..."
rm -rf "${PLUGIN_DIR}"

if [[ ! -d "${PLUGIN_DIR}" ]]; then
  print_message "$GREEN" "✓ Plugin removed successfully!"
else
  print_message "$RED" "✗ Failed to remove plugin directory"
  exit 1
fi

echo ""

# Check settings.json
SETTINGS_FILE="${HOME}/.claude/settings.json"
if [[ -f "${SETTINGS_FILE}" ]]; then
  if grep -q '"outputStyle"' "${SETTINGS_FILE}"; then
    print_message "$YELLOW" "⚠️  Note: outputStyle setting still exists in settings.json"
    print_message "$BLUE" "   You may want to remove or change it manually:"
    print_message "$BLUE" "   ${SETTINGS_FILE}"
  fi
fi

echo ""

# Summary
print_message "$GREEN" "╔════════════════════════════════════════════════════════╗"
print_message "$GREEN" "║  Uninstallation Complete! 👋                           ║"
print_message "$GREEN" "╚════════════════════════════════════════════════════════╝"
echo ""
print_message "$BLUE" "The plugin has been removed from Claude Code."
print_message "$BLUE" "Backup saved at: ${BACKUP_FILE}"
echo ""
print_message "$BLUE" "Thank you for using Claude TW Engineer Styles Plugin!"
print_message "$BLUE" "Feedback: https://github.com/Loongwoo/claude-tw-engineer-styles/issues"
echo ""
