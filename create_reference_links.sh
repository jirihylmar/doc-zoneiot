#!/bin/bash

# Documentation Link Generator
# Generates markdown links from document headings
# Usage: . $HOME/doc-zoneiot/create_reference_links.sh $HOME/doc-zoneiot

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <project-path>"
    exit 1
fi

PROJECT_PATH="$1"
DOCS_DIR="${PROJECT_PATH}/docs"
TEMP_DIR=$(mktemp -d)
OUTPUT_FILE="${DOCS_DIR}/links.md"

cleanup() {
    rm -rf "${TEMP_DIR}"
}
trap cleanup EXIT

# Validate project directory
if [ ! -d "${DOCS_DIR}" ]; then
    echo "Error: Docs directory not found at ${DOCS_DIR}"
    exit 1
fi

# Extract headings and clean up initial format
grep -Er "^#+ .*" "${DOCS_DIR}"/* | \
    grep -Ev "!" | \
    tr -d '\r' > "${TEMP_DIR}/raw.txt"

# Process names: remove file paths and heading markers, clean spaces
sed 's/.*#//' "${TEMP_DIR}/raw.txt" | \
    sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | \
    tr '\n' '\0' | tr -d '\r' | tr '\0' '\n' > "${TEMP_DIR}/names.txt"

# Process paths: extract file paths only, remove /docs prefix
sed -E "s/:#+.*//; s|${PROJECT_PATH}/docs||" "${TEMP_DIR}/raw.txt" > "${TEMP_DIR}/paths.txt"

# Normalize names for anchors (create IDs)
cat "${TEMP_DIR}/names.txt" | \
    iconv -f utf8 -t ascii//TRANSLIT//IGNORE | \
    sed -E '
        s/`//g;
        s/^[[:space:]]*//;
        s/[[:space:]]*$//;
        s/^/#/;
        y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/;
        s/[[:space:]]/-/g;
        s/([0-9]+)\.-/\1-/g;    # Remove period between number and hyphen
        s/[()]/\\&/g
    ' > "${TEMP_DIR}/names_norm.txt"

# Generate markdown links and store full paths for sorting
{
    paste -d ' ' "${TEMP_DIR}/names.txt" "${TEMP_DIR}/paths.txt" | \
        sed -E '
            s/^[[:space:]]*//;
            s/[[:space:]]*$//;
            s/^/[/;
            s| /|](|;
        ' | \
        paste -d '' - "${TEMP_DIR}/names_norm.txt" | \
        sed -E '
            s|$|) *refDoc*|;
            s|/index.md#|#|;
            s/[[:space:]]+$//;
            s/\\([()])/\1/g
        ' | \
        tr -d '\r' | \
        # Extract sort key (full path including anchor) and store with line
        sed 's|.*](\([^)]*\)).*|\1\t&|' | \
        # Sort by the extracted path
        sort -f | \
        # Remove the sort key
        cut -f2-
} > "${TEMP_DIR}/sorted_links.txt"

# Create final output with header
{
    echo "# Links"
    echo
    cat "${TEMP_DIR}/sorted_links.txt"
} > "${OUTPUT_FILE}"

echo "Links generated successfully at: ${OUTPUT_FILE}"