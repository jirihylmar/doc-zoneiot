#!/bin/bash

# Check if path argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <root_path>"
    exit 1
fi

ROOT_PATH="$1"
TODO_FILE="$ROOT_PATH/docs/todo.md"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Create header content
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

EOL

# Find all .md files except todo.md, search for TODO lines, and append to todo.md
find "$ROOT_PATH" -type f -name "*.md" ! -name "todo.md" -exec grep -H "TODO :" {} \; | while read -r line; do
    # Extract filename and line content
    filename=$(echo "$line" | cut -d':' -f1)
    content=$(echo "$line" | cut -d':' -f2-)
    
    # Format the relative path from root
    rel_path=${filename#$ROOT_PATH/}
    
    # Extract just the filename from the path (without directory structure)
    base_filename=$(basename "$rel_path" .md)
    
    # Capitalize first letter of filename for the link text
    capitalized_filename="$(tr '[:lower:]' '[:upper:]' <<< ${base_filename:0:1})${base_filename:1}"
    
    # Create the reference link format
    ref_link="[$capitalized_filename](${base_filename}.md#${base_filename})"
    
    # Append to todo.md with the content and reference link
    echo "- $content [$ref_link] *refDoc*" >> "$TODO_FILE"
done

echo "TODO list has been created in $TODO_FILE"