---
layout: post
author: Wouter Van Schandevijl
title: "A Decade of itenium Slides, Reborn in Slidev"
subTitle: "And how Claude finally got me past the activation barrier"
date: 2026-05-02
desc: >
  Ten years of itenium presentations lived in PowerPoint.
  Now they live in markdown, ship as a website, diff cleanly in git,
  and can be reviewed adversarially.
  A migration I'd been postponing for years, now done thanks to Claude.
bigimg:
  url: decade-of-itenium-slides-reborn-in-slidev-big.png
  prompt: "A nostalgic developer workshop scene split down the middle: on the left, a dusty stack of PowerPoint slides spilling off a beige CRT monitor with Clippy peeking out; on the right, a sleek modern laptop displaying clean markdown code transforming into elegant slide layouts, glowing terminal windows, git diff visualizations floating between them, fiber-optic threads connecting old to new, warm-to-cool color gradient, tech noir aesthetic, cinematic lighting, depth of field, modern flat illustration style --ar 4:1"
  origin: Midjourney
img:
  url: decade-of-itenium-slides-reborn-in-slidev-sm.png
  prompt: "A markdown file with slide separators morphing into a stack of crisp presentation slides mid-flight, each slide branded with a subtle geometric tech logo, code-to-slides transformation, clean vector flat design, soft shadows, tech-blue and accent-orange palette, playful and minimal"
  origin: Midjourney
categories: productivity
tags: [war-story,tech-talk]
extras:
  - url: https://github.com/itenium-be/Presentations
    desc: "itenium Presentations -- the Slidev source"
  - url: https://itenium-be.github.io/Presentations/
    desc: "The deployed presentations"
  - url: https://github.com/slidevjs/slidev
    desc: Presentation Slides for Developers
package-versions:
  - package: "@slidev/cli"
    version: 51.0.0
---

For ten years our presentations have lived in PowerPoint.
Decks for internal sessions, the architecture track,
the frontend track -- all in `.pptx`, all locked behind MS Office,
all painful to diff, review, or evolve.

I've wanted to migrate them to "something" for years.
But I never got around to it, because who has time for that?
Claude got me past the activation barrier and I'm never looking back.

<!--more-->

The "something" turned out to be [Slidev](https://sli.dev/).

{% include github-stars.html url="itenium-be/Presentations" desc="Our talks, now as Slidev." %}

The trigger was the first session in our 2026 AI track
"[AI & Security: The S in MCP stands for Security](https://github.com/itenium-be/AI-Security-Talk)",
the first technical session after our itenium rebranding which was more than just updating the logo,
it was a whole new PowerPoint theme. Something of a recurring pain-point: this was now the
4th PowerPoint theme. So every time I would redo an old talk, I would have to also take the
time to convert it.

I was not looking forward to that.


## Why Slidev is awesome

The pitch isn't subtle:

- **Publishable as a site.** Every deck is a static site. No "can you send me the slides?" emails -- just a URL. Ours lives at [itenium-be.github.io/Presentations][site] now.
- **Real git diffs.** A typo fix is `+1 -1`, not "binary file changed". Reviews actually work.
- **No MS Office dependency.** Edit on Linux, on a Chromebook, in the browser. Wherever. No subtle OpenOffice layout differences.
- **Adversarial review becomes possible.** Once slides are markdown, you can pipe them through an AI critique pass before the talk. More on that below.
- **All the power of HTML/CSS.** Want an animation, a Mermaid diagram, a custom transition, live TypeScript code? It's all just web.
- **Layout consistency for free.** Every slide uses the same theme components. No more "this one slide where the title is suddenly 4 pixels lower."

[site]: https://itenium-be.github.io/Presentations/


<!--block1-->


### What it looks like

A presentation with two slides:

```md
---
theme: ./theme
transition: fade
session-time: 60min
track: AI
---

# AI Security
## The S in MCP stands for Security

::image::

![](./images/cover-art.png)

<!-- These are your presenter notes -->


---
layout: default-aside
---

# ProbLLMs

<v-clicks depth="2">

- Environment <small>(Water & Electricity)</small>
- Cost <small>(GPUs, RAM, ...)</small>
- Revenue: <small><i>AI startups turn hundreds of millions into tens of millions</i></small>
- IP: Fair Use or Theft?
- Bias in training data gets amplified
  - Explainability: <small>We're often not even sure why</small>
- Weaponization: <small>Hallucinating AIs autonomously firing weapons is exactly what we need</small>

</v-clicks>
```

- Frontmatter which can be picked up by the layout
- `v-click(s)` as a tag or attribute so more text appears on click
- `::slot::`s for inserting text in multiple places



## A decade of theme regret

I gave my first tech talk for itenium at [VISUG](https://visug.be/) using
a default PowerPoint theme. It looked exactly as good as you'd expect.

After that, every itenium talk used our internal theme.
Three eras of it, actually:

1. **The ancient theme** -- from the company's earliest days. It was OK-ish.
2. **The updated theme** -- it was a dark theme, and I actually liked this one :D
3. **The rebrand theme** -- A modern and on-brand theme

And now: **a Slidev theme that matches the rebrand.**
Same fonts, same gradients, same h1/h2 "gadgets" we use on the website
-- except now they live in CSS instead of being stuck in `.pptx`.

I'm ready for our next rebranding!

> Hey Claude, update the theme based on this pptx and the new itenium.be site!

Well, hoping it's going to be just that one prompt is probably a bit optimistic ;)


## How Claude did the heavy lifting

Here's the best part: I didn't learn Slidev.
I didn't refresh my rusty Vue. I didn't have to dig into obscure CSS issues.

What I did was:

- Hand Claude our existing rebrand `.pptx` template and ask it to extract the theme into a Slidev theme package.
- Point Claude at [itenium.be](https://itenium.be) and say "match these fonts, these h1/h2 gadgets, the in-between-slides feel."

And that worked really well, but then, as usual, I got carried away...

### How I got carried away (again)

Because now I could have cool things, like a `<CountDown />` component on a "Break" slide - top priority, obviously!

```md
---
layout: break
---
# ☕ Break

::timer::

<CountDown :minutes="10" />

::image::

![](./images/funny-meme.png)
```


But things started to get really off the rails after this prompt:

> "Hey Claude, check my `./courses`... And make me a markdown table with the presentations I should convert using MoSCoW"

For context, most itenium sessions are hands-on workshops -- no
slides worth publishing. The PowerPoint-heavy ones came out as:

| Repo                         | MoSCoW | Notes                                         | Status |
|------------------------------|--------|-----------------------------------------------|--------|
| [UnitTesting][ut]            | MUST   | Old but revised several times                 | DONE   |
| [MicroServices][ms]          | MUST   | OK                                            | DONE   |
| [ntier-onion-hex][noh]       | MUST   | OK                                            | DONE   |
| [EventSourcing-CQRS][es]     | MUST   | OK                                            | DONE   |
| [Architecture-KickOff][ak]   | MUST   | Needs work probably                           | DONE   |
| [CSharp-Features][cs]        | MUST   | C# evolution; needs work, newer C# versions   |        |
| [Talk-GC][gc]                | MUST   | Should be updated, new Java & .NET GCs        |        |
| [CodeComplete][cc]           | SHOULD | OK                                            |        |
| [Mythical-Man-Month][mmm]    | SHOULD | OK                                            |        |
| [Talk-UI-UX][uiux]           | COULD  | "Don't make me think"                         |        |
| [Talk-DesignPatterns][dp]    | COULD  | Needs work probably                           |        |
| [Regex-Tutorial][regex]      | WISH   | Maybe update the blog post instead            |        |
| [Frontend-UnitTesting][feut] | WISH   | Jasmine/Jest basics; update blog instead      |        |
| [Talk-React][react]          | WISH   | Pretty old (still mentions Flow)              |        |
| [Talk-Git][git]              | WISH   | Combine with git-get-out-of-a-mess + DeepDive |        |

[ut]:    https://github.com/itenium-be/UnitTesting
[ms]:    https://github.com/itenium-be/MicroServices
[noh]:   https://github.com/itenium-be/ntier-onion-hex
[es]:    https://github.com/itenium-be/EventSourcing-CQRS
[ak]:    https://github.com/itenium-be/Architecture-KickOff
[cs]:    https://github.com/itenium-be/CSharp-Features
[gc]:    https://github.com/itenium-be/Talk-GC
[cc]:    https://github.com/itenium-be/CodeComplete
[mmm]:   https://github.com/itenium-be/Mythical-Man-Month
[uiux]:  https://github.com/itenium-be/Talk-UI-UX
[dp]:    https://github.com/itenium-be/Talk-DesignPatterns
[regex]: https://github.com/itenium-be/Regex-Tutorial
[feut]:  https://github.com/itenium-be/Frontend-UnitTesting
[react]: https://github.com/itenium-be/Talk-React
[git]:   https://github.com/itenium-be/Talk-Git

Five Musts done. Two more queued for the next time I'm scheduled to
give them. The Should / Could / Wish tail... maybe sometime :D


### The Migration Skill

Probably the largest [skill](https://github.com/itenium-be/Presentations/blob/main/MigrationSkill.md)
Claude has ever created for me.

Because converting a `.pptx` to Slidev while still keeping everything intact turned out to be not that
super easy after all. At least not for the first two PowerPoints, after that I was sipping my coffee
while admiring Claude do its thing.

- PPTX -> PDF -> HTML is what worked for me
- The HTML was too big to read in one go so it's parsed in a separate file that was easier for Claude to work with
- Because of the "section slides", slide numbers were mismatched between the old and new deck, causing a lot of confusion between Claude and myself
- Presenter notes and emojis were gone in the HTML, these needed separate parsing, another alternative representation was born
- Hidden slides were not present in the PDF, extra Skill rules were added to remedy this
- Images were not always present: what is a background image and what is an image it should take over...

So, well, in the draft for this blog post Claude said "just a weekend work". Yeah right.


## Adversarial review

As soon as the first conversion was done, I was like, wait a minute...
These were talks I did between 2022-2025, maybe there have been some
developments since then. People tell me that understanding tends to
move in IT...

So after each conversion, I fired up an adversarial review which resulted
in slides being moved around the deck, being expanded, obsolete stuff
being marked as such or removed, new angles being added etc.

The Architecture KickOff deck got the biggest overhaul and feels a lot more... SOLID now ;)
Added slides on coupling & cohesion, KISS / YAGNI / DRY, trade-offs, last responsible moment,
accidental vs essential complexity, fitness functions, ADRs.

"In just one weekend"... Sure Claude, sure. The weekend turned into a week, then two.

The architecture-track decks are in much better shape now,
definitely going to do these sessions again -- no concrete dates yet.


## All new talks ship as Slidev

Every new itenium talk now starts as a Slidev project, shipping to
the public site on push.

Each talk lives in its own repo. `Presentations` is the index --
a YAML listing which talks are `published: true`, aggregated into
one site on push. The index itself is built with Astro, which I
couldn't tell you the first thing about -- never had to glance at
the code.

And we end up with a card like this!

[![The itenium Presentations site]({{ "/assets/blog-images/decade-of-itenium-slides-reborn-in-slidev-public-site.png" | relative_url }} "The itenium Presentations site"){: .img-responsive}](https://itenium-be.github.io/Presentations/)

Ten years of decks, finally in a format that respects how the rest of
our work is done.


## Conclusion

Part of the skill is generating an "on-brand" Midjourney prompt
for the cover image. And I absolutely love these!

This is the pattern we see [all over the internet](https://lalitm.com/post/building-syntaqlite-ai/) right now,
"low priority work" that we would like to do but never get
around because it's too much learning, too much work
-- that just gets done now, because it's become so easy!
