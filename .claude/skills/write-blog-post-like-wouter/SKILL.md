---
name: write-blog-post-like-wouter
description: Use when drafting a new blog post for the itenium Jekyll blog from raw notes, links, or rough text. Produces a _drafts/YYYY-MM-DD-slug.md file with Wouter Van Schandevijl's voice, frontmatter conventions, and template structure. Triggers on "write a blog post", "draft a post", "polish into a Wouter post", "blog post like Wouter".
---

# Write a Blog Post Like Wouter

Drafts a Jekyll post for the itenium blog in Wouter Van Schandevijl's voice from raw notes/links.
Output: `_drafts/YYYY-MM-DD-slug.md` with full frontmatter, Midjourney prompts, and template-appropriate body.
User refines manually after.

## When to invoke

Triggered by phrases like "write a blog post", "draft a post about X", "polish this into a Wouter post",
"blog post like Wouter". Also matches when the user pastes raw notes/bullets and asks for a draft.

## Workflow

Follow these steps in order. Do not skip the reference-reading steps — voice anchoring depends on reading actual
posts, not summaries.

1. **Sanity check.** Confirm CWD is the blog repo: `_config.yml` + `_posts/` + `Rakefile` must all exist.
If not, report the path mismatch and stop. Do not write any files.

2. **Read user input.** Notes, links, snippets, attached files — whatever the user provided.

3. **Detect the template** from input shape. The six types and their signals:

| Template          | Signal                                                              |
|-------------------|---------------------------------------------------------------------|
| war-story         | "I picked up…", "Earlier this week…", bug/incident narrative        |
| cheat-sheet       | Comparison, syntax differences, "cheat sheet"                       |
| tool-walkthrough  | "How to install X", repo setup, UI screenshots                      |
| conference-report | "Last Thursday at itenium…", workshop/event recap                   |
| product-launch    | "I built X", origin story, repo CTA                                 |
| tiny-tip          | Small trick, snippet collection, no narrative                       |

4. **Read references** (mandatory before drafting):
- `references/canonical-posts.md` — pick 1-2 example posts for the detected template.
- Read those `_posts/` files in full.
- `references/frontmatter-spec.md` — YAML schema and edit rules.
- `references/voice-anchors.md` — phrase palette, emoji palette, AI-cliché blocklist.

5. **Ask 1-2 quick clarifying questions** ONLY if genuinely ambiguous:
- Template uncertain? Offer the two most likely options.
- No clear angle? Ask: "What's the one takeaway you want a reader to leave with?"
- Otherwise: skip and draft.

6. **Decide the title.** Short, Title Case, evocative. (Wouter's titles tend toward concrete, slightly playful: "Scout: A Self-Hosted Deep-Research Agent on Claude Code", "Build Your Own Macropad", "Kiss Decorators".)

7. **Run rake.**

```bash
bundle exec rake draft["The Decided Title"]
```

Capture the printed path. If rake fails (no bundle / no Ruby), fall back to writing the file manually using
the scaffold in `references/frontmatter-spec.md`. Slug computation: lowercase, non-alphanumeric runs → `-`,
strip leading/trailing `-`.

If rake reports `Already exists: ...`, ask the user: bump slug (append `-2`) or edit the existing file?

8. **Edit the scaffold** with the Edit tool, applying the field-by-field rules in
`references/frontmatter-spec.md`. In summary:

- Fill `subTitle`, `desc`, `bigimg.prompt` (elaborate scene + `--ar 4:1`), `img.prompt` (shorter, no aspect flag).
- Remove `series`, `package-versions`, `last_modified_at`, `updates` (keep only when this is a series / version-pinned / a revision).
- Keep `interesting:` and `extras:` as TODO placeholders.

9. **Write the body.** Replace the rake scaffold's placeholder body (the `Img: 500x500 / BigImg: 2000x500` lines and the bare `##`) with:
- 2-5 lines of hook **above** the existing `<!--more-->`.
- Sections per the template skeleton from `references/canonical-posts.md`.
- Keep `<!--block1-->` placed after the first H2.
- Apply template-appropriate sign-off (war-story: `## Conclusion` 1-liner; conference: `## What's Next`; tiny-tip: just stop).

10. **Self-check for voice drift.** Scan the body for AI-cliché phrases from `references/voice-anchors.md`. Rewrite any found.

11. **Report back.** Terse:

```
Draft: _drafts/YYYY-MM-DD-slug.md
Template: <name> (read <reference posts>)
TODO:
  - Generate images: <slug>-sm.png, <slug>-big.png (prompts in frontmatter)
  - Fill extras: <suggested repos/links>
  - Verify category/tags
```

Do not commit.

## Voice rules (compressed)

Full anchors in `references/voice-anchors.md`. The essentials:

| Aspect       | DO                                                                                                                  | DON'T                                                                                              |
|--------------|---------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Tone**     | Casual, direct, opinionated, self-deprecating. First-person heavy. Belgian-English idioms OK ("yaye").              | "Hope this helps", "Stay tuned", marketing superlatives, "we" when meaning "I".                    |
| **Openings** | Anecdote / scene / direct problem statement. Hook in 2-5 lines, then `<!--more-->`.                                 | "In this post we will…", "Today I want to talk about…", "Let's dive in", "delve into", "leverage". |
| **Emoji**    | Inline as punctuation/tone signal. ✅/❌ OK in genuine pro/con lists.                                               | As default bullet style. As decoration.                                                            |
| **Emphasis** | Bold sparingly for "the point". Parentheticals/em-dashes for asides.                                                | Bold scattered for color.                                                                          |
| **Headers**  | Title Case. ATX `## H2`, `### H3`. `* * *` (with spaces) between major sections.                                    | `#` H1. `---` rules. Inline "Step 1, Step 2".                                                      |
| **Code**     | Inline backticks for all technical tokens. Short fences with inline `// comments` explaining.                       | Long prose paragraphs around tiny snippets.                                                        |
| **Links**    | Inline `[text](url)` in body. Reference-style only inside tables, defs immediately below the table.                 | Footnotes. Reference-style outside tables.                                                         |
| **Includes** | `{% include github-stars.html url="..." %}` for every external repo. `{% include post/image.html %}` for captioned. | Plain `![]()` when a repo card or caption would fit.                                               |
| **Closing**  | Template-specific (see canonical-posts.md).                                                                         | "Hope you enjoyed!", "Subscribe", "Comment below".                                                 |

## Important nuances

- **Always read reference posts before drafting.** The skill's accuracy depends on fresh anchoring from real prose.
- **`<!--more-->` is mandatory** and marks the listing-excerpt cutoff. Place 2-5 hook lines above it.
- **`<!--block1-->` is a layout marker** placed after the first H2. Don't remove or move it.
- **Edit, don't rewrite.** Use the Edit tool to surgically replace each scaffold placeholder so the rake-generated structure is preserved.
- **No commits.**
