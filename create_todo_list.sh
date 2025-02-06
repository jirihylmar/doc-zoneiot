#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <root_path>"
    exit 1
fi

ROOT_PATH="$1"
TODO_FILE="$ROOT_PATH/docs/todo.md"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Create temporary files for opened and completed tasks
OPENED_TASKS=$(mktemp)
COMPLETED_TASKS=$(mktemp)

# Create the initial TODO file with header
cat > "$TODO_FILE" << EOL
---
title: "TODO"
tags:
  - :system_document
---
# TODO
\`\`\`yaml
Author: :team_jirihylmar
Created: $CURRENT_DATE
Updated: 1970-01-01 00:00:00
Master: mkdocs
Purpose:
- Overview of TODO in ZONEIOT documentation.
- !!! READ ONLY FILE. Extracted from the documentation.
\`\`\`

## Opened

EOL

# Function to process markdown files
process_markdown_file() {
    local file="$1"
    local current_section=""

    while IFS= read -r line; do
        # Track section headers
        if [[ $line =~ ^##[[:space:]]+(.*) ]]; then
            current_section="${BASH_REMATCH[1]}"
        fi

        # Process TODO items
        if [[ $line =~ ^[[:space:]]*-[[:space:]]\[([ x])\][[:space:]]TODO ]]; then
            rel_path=${file#$ROOT_PATH/docs/}
            dir_path=$(dirname "$rel_path")
            base_name=$(basename "$file" .md)
            checkbox_state="${BASH_REMATCH[1]}"
            
            # Create section anchor if we have a section
            local section_ref=""
            if [ -n "$current_section" ]; then
                section_anchor=$(echo "${current_section,,}" | tr " " "-")
                section_ref=" [${current_section}](/${dir_path}/${base_name}#${section_anchor}) *refDoc*"
            fi
            
            # Extract the TODO content, preserving the original formatting
            todo_content="${line#*- }"
            
            # Route to appropriate temp file based on completion status
            if [ "$checkbox_state" = "x" ]; then
                echo "- ${todo_content}${section_ref}" >> "$COMPLETED_TASKS"
            else
                echo "- ${todo_content}${section_ref}" >> "$OPENED_TASKS"
            fi
        fi
    done < "$file"
}

# Find and process all markdown files
find "$ROOT_PATH" -type f -name "*.md" ! -name "todo.md" | while read -r file; do
    process_markdown_file "$file"
done

# Append opened tasks
sort "$OPENED_TASKS" >> "$TODO_FILE"

# Add Completed section and tasks
echo -e "\n## Completed\n" >> "$TODO_FILE"
sort "$COMPLETED_TASKS" >> "$TODO_FILE"

# Add a final newline
echo "" >> "$TODO_FILE"

# Clean up temp files
rm -f "$OPENED_TASKS" "$COMPLETED_TASKS"

echo "TODO list has been created in $TODO_FILE"