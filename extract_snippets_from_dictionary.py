'''
# extract_snippets_from_dictionary.py

Script that generates VS Code snippets from project tags. 

## Locations
- Script: `~/doc-zoneiot/extract_snippets_from_dictionary.py`
- Input: `~/doc-zoneiot/docs/dictioanry.md`
- Output: `~/doc-zoneiot/.vscode/zoneiot.code-snippets`

## Usage
```bash
python3 ~/doc-zoneiot/extract_snippets_from_dictionary.py
```

## Tag Categories
- Team (`ziot_team`): :team_*
- Organizations (`ziot_org`): :org_*  
- Tasks (`ziot_task`): :task_*
- Results (`ziot_result`): :result_*

## VS Code Usage
1. Type trigger (e.g., `ziot_team`)
2. Select tag from dropdown
3. Press Tab/Enter

Extracts tags from markdown file and creates VS Code snippets for quick insertion. Organizes tags by category with appropriate prefixes. Creates .vscode directory if needed.
'''
import json
import re
import os

def extract_tags_by_category(text):
    """Extract tags organized by category."""
    categories = {
        'team': [],      # Team member tags
        'org': [],       # Organization tags
        'task': [],      # Task tags
        'result': [],    # Result tags
        'system': []    # System tags
    }
    
    # Find all tags with improved regex
    pattern = r'(?<![\w\.]):(?![\w\.]+:)\b([a-zA-Z_][a-zA-Z0-9_]*(?:_[a-zA-Z0-9]+)*)\b'
    matches = re.finditer(pattern, text)
    
    for match in matches:
        tag = match.group(0)
        
        # Categorize based on prefix without modifying the tag
        if 'team_' in tag:
            categories['team'].append(tag)
        elif 'org_' in tag:
            categories['org'].append(tag)
        elif 'task_' in tag:
            categories['task'].append(tag)
        elif 'result_' in tag:
            categories['result'].append(tag)
        elif 'system_' in tag:
            categories['system'].append(tag)
    
    # Sort each category
    for category in categories:
        categories[category] = sorted(list(set(categories[category])))
    
    return categories

def create_snippets(categories):
    """Create snippets JSON structure with categories."""
    snippets = {
        "ZIOT Team Members": {
            "prefix": "ziot_team",
            "body": [
                "${1|" + ",".join(categories['team']) + "|}"
            ],
            "description": "Insert a ZONEIOT team member tag"
        },
        "ZIOT Organizations": {
            "prefix": "ziot_org",
            "body": [
                "${1|" + ",".join(categories['org']) + "|}"
            ],
            "description": "Insert a ZONEIOT organization tag"
        },
        "ZIOT Tasks": {
            "prefix": "ziot_task",
            "body": [
                "${1|" + ",".join(categories['task']) + "|}"
            ],
            "description": "Insert a ZONEIOT task tag"
        },
        "ZIOT Results": {
            "prefix": "ziot_result",
            "body": [
                "${1|" + ",".join(categories['result']) + "|}"
            ],
            "description": "Insert a ZONEIOT result tag"
        },
        "ZIOT System": {
            "prefix": "ziot_system",
            "body": [
                "${1|" + ",".join(categories['system']) + "|}"
            ],
            "description": "Insert a ZONEIOT system tag"
        }
    }
    return snippets

def main():
    # Read input file from correct location
    with open(os.path.expanduser('~/doc-zoneiot/docs/dictionary.md'), 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract and categorize tags
    categories = extract_tags_by_category(content)

    # Create snippets structure
    snippets = create_snippets(categories)

    # Ensure .vscode directory exists
    os.makedirs(os.path.expanduser('~/doc-zoneiot/.vscode'), exist_ok=True)

    # Write to file
    output_path = os.path.expanduser('~/doc-zoneiot/.vscode/zoneiot.code-snippets')
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(snippets, f, indent=2)

    print(f"Created snippets file at {output_path}")
    print("\nTags found by category:")
    for category, tags in categories.items():
        print(f"\n{category.upper()}: {len(tags)} tags")
        for tag in tags[:3]:  # Show first 3 tags of each category
            print(f"  {tag}")

if __name__ == "__main__":
    main()