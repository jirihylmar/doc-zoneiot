#!/bin/bash

# Check if path argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <root_path>"
    exit 1
fi

ROOT_PATH="$1"
STATS_FILE="$ROOT_PATH/support/statistics.md"
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Create header content
cat > "$STATS_FILE" << EOL
---
title: "Statistics"
tags:
  - :system_document
---
# Statistics
\`\`\`yaml
Author: :team_jirihylmar
Created: $CURRENT_DATE
Updated: 1970-01-01 00:00:00
Master: mkdocs
Purpose:
- Statistics of ZONEIOT documentation.
\`\`\`

Table: ZONEIOT Documentation Statistics

| Key | Value |
|---|---|
EOL

# Function to format number with dots as thousands separator
format_number() {
    echo $1 | sed ':a;s/\B[0-9]\{3\}\>/\.&/;ta'
}

# Function to convert bytes to MB with 2 decimal places
to_mb() {
    local bytes=$1
    printf "%.2f MB" $(bc -l <<< "$bytes/1048576")
}

# Get total repo size
total_size=$(du -sb "$ROOT_PATH" | cut -f1)
total_size_mb=$(to_mb $total_size)

# Get .git size
git_size=0
if [ -d "$ROOT_PATH/.git" ]; then
    git_size=$(du -sb "$ROOT_PATH/.git" | cut -f1)
fi
git_size_mb=$(to_mb $git_size)

# Get size excluding .git
no_git_size=$((total_size - git_size))
no_git_size_mb=$(to_mb $no_git_size)

# Count markdown files
md_files=$(find "$ROOT_PATH" -name "*.md" ! -path "*/.git/*" | wc -l)

# Initialize counters
total_chars=0
total_words=0
total_headings=0

# Process each markdown file
while IFS= read -r file; do
    # Count characters (excluding whitespace)
    chars=$(tr -d '[:space:]' < "$file" | wc -c)
    total_chars=$((total_chars + chars))
    
    # Count words
    words=$(wc -w < "$file")
    total_words=$((total_words + words))
    
    # Count headings (lines starting with #)
    headings=$(grep -c "^#" "$file")
    total_headings=$((total_headings + headings))
done < <(find "$ROOT_PATH" -name "*.md" ! -path "*/.git/*")

# Format numbers with dots as thousands separator
total_chars_formatted=$(format_number $total_chars)
total_words_formatted=$(format_number $total_words)
total_headings_formatted=$(format_number $total_headings)

# Write statistics to file
cat >> "$STATS_FILE" << EOL
| Repo size | $total_size_mb |
| Repo size excluding .git | $no_git_size_mb |
| Repo size .git | $git_size_mb |
| Number of pages | $md_files |
| Number of characters | $total_chars_formatted |
| Number of words | $total_words_formatted |
| Number of headings | $total_headings_formatted |
EOL

echo "Statistics have been created in $STATS_FILE"