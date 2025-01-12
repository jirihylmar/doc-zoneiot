#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <root_path>"
    exit 1
fi

ROOT_PATH="$1"
TODO_FILE="$ROOT_PATH/docs/todo.md"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

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

find "$ROOT_PATH" -type f -name "*.md" ! -name "todo.md" | while read -r file; do
    current_section=""
    while IFS= read -r line; do
        if [[ $line =~ ^##[[:space:]]+(.*) ]]; then
            current_section="${BASH_REMATCH[1]}"
        elif [[ $line =~ ^\-[[:space:]]\[[[:space:]]\][[:space:]]TODO[[:space:]]: ]]; then
            rel_path=${file#$ROOT_PATH/docs/}
            dir_path=$(dirname "$rel_path")
            base_name=$(basename "$file" .md)
            section_anchor=$(echo "${current_section,,}" | tr " " "-")
            echo "- ${line:2} [${current_section}](/${dir_path}/${base_name}#${section_anchor}) *refDoc*" >> "$TODO_FILE"
        fi
    done < "$file"
done

echo "TODO list has been created in $TODO_FILE"