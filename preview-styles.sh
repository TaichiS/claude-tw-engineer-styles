#!/bin/bash

# Claude TW Engineer Styles Plugin - Style Preview Tool
# This script shows a preview of each available style

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

print_colored() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${NC}"
}

# Header
print_colored "$CYAN" "╔════════════════════════════════════════════════════════════════════╗"
print_colored "$CYAN" "║                                                                    ║"
print_colored "$CYAN" "║     🎨 Claude TW Engineer Styles - Style Preview                  ║"
print_colored "$CYAN" "║                                                                    ║"
print_colored "$CYAN" "╚════════════════════════════════════════════════════════════════════╝"
echo ""

# Function to extract frontmatter and first few lines
preview_style() {
  local style_file=$1
  local style_name=$2
  local color=$3

  if [[ ! -f "$style_file" ]]; then
    print_colored "$RED" "  ✗ File not found: $style_file"
    return
  fi

  # Extract name and description from frontmatter
  local name=$(grep "^name:" "$style_file" | sed 's/name: //')
  local description=$(grep "^description:" "$style_file" | sed 's/description: //')

  print_colored "$color" "┌────────────────────────────────────────────────────────────────────┐"
  print_colored "$color" "│  $style_name"
  print_colored "$color" "└────────────────────────────────────────────────────────────────────┘"
  echo ""
  print_colored "$BLUE" "  名稱: $name"
  print_colored "$BLUE" "  描述: $description"
  echo ""

  # Show first few meaningful lines (skip frontmatter)
  print_colored "$YELLOW" "  📝 內容預覽:"
  echo ""

  # Skip frontmatter and show actual content
  awk '
    BEGIN { in_frontmatter=0; shown=0 }
    /^---$/ { in_frontmatter = !in_frontmatter; next }
    !in_frontmatter && NF > 0 && shown < 15 {
      print "    " $0
      shown++
    }
  ' "$style_file"

  echo ""
  print_colored "$MAGENTA" "  檔案大小: $(wc -c < "$style_file") bytes"
  print_colored "$MAGENTA" "  總行數: $(wc -l < "$style_file") lines"
  echo ""
  echo ""
}

# Preview each style
preview_style "styles/engineer-professional.md" "1️⃣  專業工程師 (engineer-professional)" "$GREEN"
preview_style "styles/laowang-engineer.md" "2️⃣  老王技術流 (laowang-engineer)" "$YELLOW"
preview_style "styles/nekomata-engineer.md" "3️⃣  貓娘工程師 (nekomata-engineer)" "$MAGENTA"
preview_style "styles/ojousama-engineer.md" "4️⃣  傲嬌大小姐工程師 (ojousama-engineer)" "$CYAN"

# Footer
print_colored "$GREEN" "╔════════════════════════════════════════════════════════════════════╗"
print_colored "$GREEN" "║  配置方法 | Configuration                                          ║"
print_colored "$GREEN" "╚════════════════════════════════════════════════════════════════════╝"
echo ""
print_colored "$BLUE" "  編輯 ~/.claude/settings.json 並添加："
echo ""
print_colored "$YELLOW" '  {
    "outputStyle": "nekomata-engineer"
  }'
echo ""
print_colored "$BLUE" "  可用值:"
print_colored "$BLUE" "    • engineer-professional"
print_colored "$BLUE" "    • laowang-engineer"
print_colored "$BLUE" "    • nekomata-engineer"
print_colored "$BLUE" "    • ojousama-engineer"
echo ""
print_colored "$CYAN" "  完整文檔: README.md"
echo ""
