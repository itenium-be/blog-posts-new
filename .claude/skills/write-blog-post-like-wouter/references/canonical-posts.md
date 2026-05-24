# Canonical Posts by Template

When drafting, identify the template type from the input, then **read the reference posts listed for that template** before writing a single line of body content. The voice anchors live in the prose itself, not in summaries.

## Template detection heuristics

| Signal in input                                                                  | Likely template      |
|----------------------------------------------------------------------------------|----------------------|
| "I picked up a UserStory…", "Earlier this week I…", a bug story                  | war-story            |
| Comparison or syntax-side-by-side, "cheat sheet", "all the X in one place"       | cheat-sheet          |
| "How to install X", repo to set up, screenshots of UI                            | tool-walkthrough     |
| "Last Thursday at itenium…", workshop or event recap, group photos               | conference-report    |
| "I built X", origin story, design rationale                                      | product-launch       |
| Single small trick, snippet collection, no narrative                             | tiny-tip             |

When two templates fit equally well, ask the user which.

## war-story

**Read first:**
- `_posts/design/2019-09-19-CQRS-Ramble.md`
- `_posts/design/2024-09-03-kiss-decorators.md`
- `_posts/design/2021-01-27-first-hack.md` (shorter example)

**Opening pattern:** Anecdote that drops the reader into a moment.
> "I picked up a UserStory to make a small adjustment."
> "Earlier this week I deleted half of our test suite."

**Section skeleton:**
1. Hook (2-5 lines) → `<!--more-->`
2. `## The Problem` (or `## The X` named after the topic — `## The CQRS Mayhem`)
3. One or more `## The Detour` / `## The Search For Answers` middle sections
4. `## The Fix` / `## The Realisation`
5. `## Conclusion` — one-liner. Often a meme image after.

**Sign-off:** A single short paragraph or a 3-bullet "lessons learned" list. Sometimes a `:)` and stop.

## cheat-sheet

**Read first:**
- `_posts/dotnet/2024-03-13-testing-frameworks.md`
- `_posts/javascript/2019-02-24-array-prototype.md`
- `_posts/npm/angular/2019-02-20-angular-pipes.md`

**Opening pattern:** One declarative sentence.
> "A cheat sheet outlining the syntax differences between VB.NET and C#."

**Section skeleton:**
1. Hook (1-3 lines) → `<!--more-->`
2. Optional teaser bullet list ("Along the way we'll discover…")
3. One `## H2` per topic area, each with:
   - `{: .table-code}` comparison table
   - Fenced code example showing the feature with inline `// comment` explanations
4. `* * *` horizontal rules between major sections
5. Reference-style link definitions at the foot of the file

**Sign-off:** None typically — the reference block ends the post.

## tool-walkthrough

**Read first:**
- `_posts/dev-setup/synology/2024-06-01-synology-setup.md`
- `_posts/dev-setup/git/2024-09-08-git-hooks-with-husky-v9.md`
- `_posts/dev-setup/2024-08-31-itenium-frontend-track-setup.md`

**Opening pattern:** Problem-you-wanted-solved.
> "Adding the `[AllowAnonymous]` whenever a new Controller is added — it's something easily forgotten."

**Section skeleton:**
1. Hook (2-4 lines) → `<!--more-->`
2. `## What it looks like` — screenshot
3. `## Requirements` — bullet list + `{% include github-stars.html url="owner/repo" %}` for the main project
4. `## Installation` — fenced shell commands
5. Per-feature `## H2` sections with code + screenshots

**Sign-off:** Often just stops. Sometimes `## Caveats` or `## What's Next`.

## conference-report

**Read first:**
- `_posts/dev-setup/2023-10-05-build-your-own-macropad.md`
- `_posts/ai/2026-03-18-skillforge-ai-bootcamp.md`
- `_posts/databases/2024-10-03-sql-training.md`

**Opening pattern:** Date + place anchor.
> "Last Thursday we built our own macropad at itenium."

**Section skeleton:**
1. Hook (2-4 lines) → `<!--more-->`
2. `## What it looks like` — hero photo
3. `## Components` / `## What We Used`
4. `## The Session` / `## The Build` — narrative with photos via `{% include post/image.html %}`
5. `### What's Next` — future plans

**Sign-off:** `### What's Next` paragraph, usually with 😎.

## product-launch

**Read first:**
- `_posts/ai/2026-05-02-scout-a-self-hosted-deep-research-agent-on-claude-code.md`
- `_posts/dev-setup/2018-08-30-git-numbered-add-for-powershell.md`
- `_posts/javascript/2025-10-23-starify-links.md`

**Opening pattern:** Origin story.
> "Every year the same problem: what to buy for her birthday."
> "Back in 2019 I created X to solve Y."

**Section skeleton:**
1. Hook (3-5 lines) → `<!--more-->`
2. Hero image / one-diagram explanation
3. `## Why not just use X?` — competitor comparison
4. `## Decision 1: ...` / `## Decision 2: ...` — numbered design rationale H2s
5. `## What it costs` — table
6. `## Try it` — one-line install
7. `## What's reusable` — porting takeaways

**Sign-off:** Repo CTA: `⭐ github.com/Laoujin/... if this is useful — helps me prioritize.`

## tiny-tip

**Read first:**
- `_posts/productivity/2019-01-12-programming-mnemonics.md`
- `_posts/productivity/2019-02-27-rubber-duck-debugging.md`
- `_posts/npm/angular/2024-12-15-angular-new-template-syntax.md`

**Opening pattern:** One-sentence hook.

**Section skeleton:**
1. Hook (1-2 lines) → `<!--more-->`
2. Sequence of `## small heading → fence` pairs, no transitions

**Sign-off:** Just stop. Maybe a smiley.
