#!/bin/bash

# Claude TW Engineer Styles Plugin - Verification Script
# This script verifies that the plugin is correctly structured and ready to use

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
print_message "$BLUE" "║  Claude TW Engineer Styles Plugin - Verification     ║"
print_message "$BLUE" "╚═══════════════════════════════════════════════════════╝"
echo ""

# Check plugin.json
if [[ -f ".claude-plugin/plugin.json" ]]; then
  print_check 0 "plugin.json exists"

  # Validate JSON syntax
  if python3 -c "import json; json.load(open('.claude-plugin/plugin.json'))" 2>/dev/null; then
    print_check 0 "plugin.json is valid JSON"
  else
    print_check 1 "plugin.json is invalid JSON"
  fi
else
  print_check 1 "plugin.json not found"
fi

# Check hooks.json
if [[ -f "hooks/hooks.json" ]]; then
  print_check 0 "hooks.json exists"

  if python3 -c "import json; json.load(open('hooks/hooks.json'))" 2>/dev/null; then
    print_check 0 "hooks.json is valid JSON"
  else
    print_check 1 "hooks.json is invalid JSON"
  fi
else
  print_check 1 "hooks.json not found"
fi

# Check session-start.sh
if [[ -f "hooks-handlers/session-start.sh" ]]; then
  print_check 0 "session-start.sh exists"

  if [[ -x "hooks-handlers/session-start.sh" ]]; then
    print_check 0 "session-start.sh is executable"
  else
    print_check 1 "session-start.sh is not executable (run: chmod +x hooks-handlers/session-start.sh)"
  fi
else
  print_check 1 "session-start.sh not found"
fi

# Check style files
echo ""
print_message "$BLUE" "Checking style files:"
styles=("engineer-professional" "laowang-engineer" "nekomata-engineer" "ojousama-engineer")
for style in "${styles[@]}"; do
  if [[ -f "styles/${style}.md" ]]; then
    print_check 0 "${style}.md exists"
  else
    print_check 1 "${style}.md not found"
  fi
done

# Check documentation
echo ""
print_message "$BLUE" "Checking documentation:"
[[ -f "README.md" ]] && print_check 0 "README.md" || print_check 1 "README.md"
[[ -f "LICENSE" ]] && print_check 0 "LICENSE" || print_check 1 "LICENSE"
[[ -f "CHANGELOG.md" ]] && print_check 0 "CHANGELOG.md" || print_check 1 "CHANGELOG.md"
[[ -f "package.json" ]] && print_check 0 "package.json" || print_check 1 "package.json"

# Check install script
echo ""
if [[ -f "install.sh" ]]; then
  print_check 0 "install.sh exists"
  if [[ -x "install.sh" ]]; then
    print_check 0 "install.sh is executable"
  else
    print_check 1 "install.sh is not executable (run: chmod +x install.sh)"
  fi
else
  print_check 1 "install.sh not found"
fi

# Test session-start.sh output
echo ""
print_message "$BLUE" "Testing session-start.sh output:"
if [[ -x "hooks-handlers/session-start.sh" ]]; then
  if CLAUDE_PLUGIN_ROOT="$(pwd)" ./hooks-handlers/session-start.sh > /tmp/plugin-test.json 2>/dev/null; then
    if python3 -c "import json; json.load(open('/tmp/plugin-test.json'))" 2>/dev/null; then
      print_check 0 "session-start.sh produces valid JSON output"

      # Check required fields
      if python3 -c "import json; d=json.load(open('/tmp/plugin-test.json')); assert 'hookSpecificOutput' in d" 2>/dev/null; then
        print_check 0 "JSON contains hookSpecificOutput"
      else
        print_check 1 "JSON missing hookSpecificOutput"
      fi

      if python3 -c "import json; d=json.load(open('/tmp/plugin-test.json')); assert d['hookSpecificOutput']['hookEventName'] == 'SessionStart'" 2>/dev/null; then
        print_check 0 "hookEventName is SessionStart"
      else
        print_check 1 "hookEventName is not SessionStart"
      fi

      if python3 -c "import json; d=json.load(open('/tmp/plugin-test.json')); assert 'additionalContext' in d['hookSpecificOutput']" 2>/dev/null; then
        print_check 0 "JSON contains additionalContext"
      else
        print_check 1 "JSON missing additionalContext"
      fi
    else
      print_check 1 "session-start.sh produces invalid JSON"
    fi
    rm -f /tmp/plugin-test.json
  else
    print_check 1 "session-start.sh execution failed"
  fi
else
  print_check 1 "session-start.sh is not executable"
fi

# Summary
echo ""
print_message "$GREEN" "╔═══════════════════════════════════════════════════════╗"
print_message "$GREEN" "║  Verification Complete!                               ║"
print_message "$GREEN" "╚═══════════════════════════════════════════════════════╝"
echo ""
print_message "$BLUE" "Plugin is ready to install!"
print_message "$BLUE" "Run: ./install.sh"
echo ""
