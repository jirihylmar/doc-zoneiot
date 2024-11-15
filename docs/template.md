---
title: "Template"
tags:
  - :system_document
---

# Template

```yaml
Author: :team_jirihylmar
Created: 2024-11-14 11:32:01
Updated: 2024-11-15 07:00:28
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- template for creating pages in `mkdocs`
```

## Purpose of `mkdoc` concept

- Utilize the power of AI LLM
- Generate report for project´s authorities automatically
- Reproducibility, new team members boarding

## Structure of the raw page in `mkdocs`

There is on the single level 1 heading, which equals to a document title.

Header `yaml` comes right after the the level 1 heading. Repeats page title and tags. It can also include another instructions regarding the page handling by `mkdocs` system.

```yaml
---
title: "Template page"
tags:
  - :system_document
hide:
  - navigation
  - toc
---
```

The page shall start with the internal `yaml`.

Parts `Author`, `Created`, `Updated` will be used to generate progress reports. In case of automatic update Unix epoch, which began on January 1, 1970, at 00:00:00 UTC is used. `Updated: 1970-01-01 00:00:00`.

`Master` can be `mkdocs`, then it is edited within `doc-zoneiot` repository. Some pages can be generated automatically by other means and included in the documentation as copies. Typically we can consolidate to the documentation READMES to programs, results of analyses etc. which are maintained elsewhere.

`Contributors` are team members who contribute to page development. Separated by `, `. In case of an automated process, this field can be omitted.

`Purpose` should include information about a purpose and lines starting with `- `.

`````
```yaml
Author: :team_jirihylmar
Created: 2024-11-14 11:32:01
Updated: 2024-11-15 07:00:28
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- template for creating pages in mkdocs
```
`````

