# Frontmatter Specification

The canonical scaffold is produced by `rake draft["Title"]` (see `Rakefile`). This file documents what each field means, what to fill in, and what to remove.

## Rake-generated scaffold

```yaml
---
layout: post
author: Wouter Van Schandevijl
title: "Title from rake arg"
subTitle: ""
date: YYYY-MM-DD
desc: >
  only used in og:desc
bigimg:
  url: slug-big.png
  prompt: " --ar 4:1"
  origin: Midjourney
img:
  url: slug-sm.png
  prompt: ""
  origin: Midjourney
categories: productivity | dotnet | javascript | dev-setup | design | trends | security | docker | databases | ruby
tags: [powershell,autohotkey,sql,angular,testing,excel,git,cheat-sheet,tutorial,windows,product,war-story,regex,debugging,meta,tech-talk,pragmatic-tips,fun,hacking,book-review,synology,mongo]
series: series-unique-name
interesting:
  - url:
    desc: ""
extras:
  - url:
    desc: ""
package-versions:
  - package:
    version:
last_modified_at:
updates:
  - date:
    desc: ""
---
```

## Field-by-field edit rules

| Field                | Action                                                                                            |
|----------------------|---------------------------------------------------------------------------------------------------|
| `layout`             | Leave as `post`.                                                                                  |
| `author`             | Leave as `Wouter Van Schandevijl`. For co-author: `Onur Bugdayci and Van Schandevijl Wouter`.     |
| `title`              | Already set by rake. Do not re-quote.                                                             |
| `subTitle`           | Fill with a kicker, pun, or expansion of the title. Quoted string.                                |
| `date`               | Leave as today's date set by rake.                                                                |
| `desc`               | Replace `"only used in og:desc"` with 2-4 sentences. May end with an emoji. Multi-line `>` block. |
| `bigimg.url`         | Already `slug-big.png` — leave.                                                                   |
| `bigimg.prompt`      | Replace `" --ar 4:1"` with: `"<elaborate scene description> --ar 4:1"` (keep the aspect-ratio flag suffix). |
| `bigimg.origin`      | Leave as `Midjourney`.                                                                            |
| `img.url`            | Already `slug-sm.png` — leave.                                                                    |
| `img.prompt`         | Fill with a shorter prompt matching the bigimg scene. NO `--ar` flag (square crop).               |
| `img.origin`         | Leave as `Midjourney`.                                                                            |
| `categories`         | Leave the pipe-list as is                                                                         |
| `tags`               | Leave the list as is                                                                              |
| `toc`                | **Deprecated** skip toc                                                                           |
| `series`             | **Remove** unless this post is part of an existing series; then set to that series id.            |
| `interesting`        | Keep as TODO placeholder (the empty `- url: / desc: ""` form).                                    |
| `extras`             | Keep as TODO placeholder.                                                                         |
| `package-versions`   | **Remove** unless the the blog post is about the package(s).                                      |
| `last_modified_at`   | **Remove** for new drafts.                                                                        |
| `updates`            | **Remove** for new drafts.                                                                        |

## Fallback: writing the file manually

If `rake draft["Title"]` fails (no bundle/Ruby), write the file directly with the scaffold above.
Slug computation: lowercase, replace non-alphanumeric runs with `-`, strip leading/trailing `-`.
Filename: `_drafts/<today>-<slug>.md`. Today's date format: `YYYY-MM-DD`.
