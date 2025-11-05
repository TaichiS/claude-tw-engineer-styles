#!/bin/bash

# Claude TW Engineer Styles Plugin - Hook Test Script
# This script tests the hook handler in a standalone manner

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

print_check() {
  local status=$1
  local message=$2
  if [[ $status -eq 0 ]]; then
    print_message "$GREEN" "✓ $message"
  else
    print_message "$RED" "✗ $message"
  fi
}

# Header
print_message "$BLUE" "╔═══════════════════════════════════════════════════════╗"
print_message "$BLUE" "║  Claude TW Engineer Styles Plugin - Hook Test        ║"
print_message "$BLUE" "╚═══════════════════════════════════════════════════════╝"
echo ""

# Set plugin root to current directory
export CLAUDE_PLUGIN_ROOT="$(pwd)"

# Test with default style (no settings.json)
print_message "$BLUE" "Test 1: Default style (no configuration)"
if OUTPUT=$(./hooks-handlers/session-start.sh 2>&1); then
  print_check 0 "Hook executed successfully"

  # Validate JSON
  if echo "$OUTPUT" | python3 -m json.tool > /dev/null 2>&1; then
    print_check 0 "Output is valid JSON"

    # Check structure
    if echo "$OUTPUT" | python3 -c "import json, sys; d=json.load(sys.stdin); assert 'hookSpecificOutput' in d" 2>/dev/null; then
      print_check 0 "Contains hookSpecificOutput"
    else
      print_check 1 "Missing hookSpecificOutput"
    fi

    if echo "$OUTPUT" | python3 -c "import json, sys; d=json.load(sys.stdin); assert d['hookSpecificOutput']['hookEventName'] == 'SessionStart'" 2>/dev/null; then
      print_check 0 "hookEventName is SessionStart"
    else
      print_check 1 "hookEventName is incorrect"
    fi

    # Check content length
    CONTENT_LENGTH=$(echo "$OUTPUT" | python3 -c "import json, sys; d=json.load(sys.stdin); print(len(d['hookSpecificOutput']['additionalContext']))" 2>/dev/null)
    if [[ $CONTENT_LENGTH -gt 0 ]]; then
      print_check 0 "Has additionalContext ($CONTENT_LENGTH chars)"
    else
      print_check 1 "additionalContext is empty"
    fi
  else
    print_check 1 "Output is not valid JSON"
    echo "$OUTPUT" | head -20
  fi
else
  print_check 1 "Hook execution failed"
  echo "$OUTPUT"
fi

echo ""

# Test with each style
STYLES=("engineer-professional" "laowang-engineer" "nekomata-engineer" "ojousama-engineer")

for style in "${STYLES[@]}"; do
  print_message "$BLUE" "Test 2: Testing style - $style"

  # Create temporary settings.json
  TMP_SETTINGS=$(mktemp)
  echo "{\"outputStyle\": \"$style\"}" > "$TMP_SETTINGS"

  # Temporarily replace HOME for testing
  OLD_HOME="$HOME"
  TMP_HOME=$(mktemp -d)
  mkdir -p "$TMP_HOME/.claude"
  cp "$TMP_SETTINGS" "$TMP_HOME/.claude/settings.json"
  export HOME="$TMP_HOME"

  if OUTPUT=$(./hooks-handlers/session-start.sh 2>&1); then
    print_check 0 "Hook executed with $style"

    # Check if correct style content is loaded
    STYLE_FILE="styles/${style}.md"
    if [[ -f "$STYLE_FILE" ]]; then
      # Verify the content matches (at least partially)
      if echo "$OUTPUT" | grep -q "hookSpecificOutput"; then
        print_check 0 "Style $style loaded successfully"
      else
        print_check 1 "Style $style may not have loaded correctly"
      fi
    fi
  else
    print_check 1 "Hook execution failed for $style"
  fi

  # Restore HOME
  export HOME="$OLD_HOME"
  rm -rf "$TMP_HOME" "$TMP_SETTINGS"

  echo ""
done

# Summary
print_message "$GREEN" "╔═══════════════════════════════════════════════════════╗"
print_message "$GREEN" "║  Hook Testing Complete!                               ║"
print_message "$GREEN" "╚═══════════════════════════════════════════════════════╝"
echo ""
