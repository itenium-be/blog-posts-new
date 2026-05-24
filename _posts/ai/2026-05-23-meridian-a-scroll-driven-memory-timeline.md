---
layout: post
author: Wouter Van Schandevijl
title: "Meridian: A Scroll-Driven Memory Timeline"
subTitle: "Drop in a folder of photos, get a scrollable trip-map you can host anywhere"
date: 2026-05-23
desc: >
  Meridian started as a birthday gift and ended up MIT on GitHub.
  A triage UI eats a photo folder, pulls EXIF, geocodes locations,
  looks up the weather on that day -- and the React/MapLibre app
  turns the result into a scroll-driven timeline where the map
  draws the travel lines between the memories.
bigimg:
  url: meridian-a-scroll-driven-memory-timeline-big.png
  prompt: "top-down view of a vintage travel journal lying open on a worn oak table, scattered polaroid photos connected by hand-drawn dotted ink trails curling across a softly tinted maplibre-style topographic map, small wax-sealed location pins marking each photo, warm cream paper, muted teal coastlines and burnt-sienna route lines, late-afternoon golden light, linen grain, editorial-illustration style, painterly with crisp ink line work, clean negative space along the top edge for a blog title overlay --ar 4:1"
  origin: Midjourney
img:
  url: meridian-a-scroll-driven-memory-timeline-sm.png
  prompt: "a single polaroid photo dropping onto a stylized map with a glowing ink trail connecting it to the next pin, soft pastel cartography, clean flat vector illustration, warm cream and teal palette, playful and minimal"
  origin: Midjourney
categories: ai
tags: [product,war-story]
extras:
  - url: https://github.com/Laoujin/Meridian
    desc: "Meridian: the source"
  - url: https://laoujin.github.io/Meridian/
    desc: "Landing page with the two live demos"
  - url: https://laoujin.github.io/Meridian/NY-Trip/
    desc: "Demo: a 5-day New York trip"
  - url: https://laoujin.github.io/Meridian/Love-Story/
    desc: "Demo: how we met -- Leuven & Antwerp"
---

The day before her birthday, I was talking about the awesomeness that is
[Scout]({% post_url ai/2026-05-02-scout-a-self-hosted-deep-research-agent-on-claude-code %})
and she asked if I could set up a Scout/Atlas for her as well. And then she
remarked that I'd better never give her an app as a gift.

{% include post/image.html file="meridian-oopsie.jpg" alt="" desc="Because that is exactly what I had been doing these past weekends..." maxWidth="600px" %}

<!--more-->

## The Name

At first this was called my nickname for her but apparently even when there are 4 Claude Code
terminals open and one of them contains her name somewhere, she notices that, so I had Claude
whip up a more generic name so I didn't have to explain myself. **Meridian** was born 🎉


## The Data

Last year we organized the first itenium Open Space day. One of the sessions I attended was about
"Second Brain" and "[Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten)".
It took me a few months but I finally did some
research and decided upon **Obsidian**.

In there I'm keeping track of all our `#date`s in the "Daily Notes" so I had
Claude extract text, pictures, locations of all our dates and create json files.

<!--block1-->


## The App

Is basically a map for a mobile phone where as you scroll a line is drawn between
"memories" from the json file and as you arrive at a new memory, it displays some
text, pictures, video, starts playing audio (you know for when there is a song
linked to that memory!!), the weather, some emojis.



## The Claude Interventions

I had to intervene, multiple times here. At first I thought that Claude would eat this up,
it sounds simple enough: scroll and draw a line from A to B. The tricky part turned out to be
the map handling: zooming in and out + changing the center so that the all starting and ending
points are visible at all times while keeping the map movements "smooth".

It worked perfectly for memory X but the prompts for making memory Y work broke memory X again,
and vice versa, over and over, again and again.

I got disappointed with Claude pretty fast so I offered installing Playwright MCP, as per our
AI session [From Vibe Coding to Agentic Engineering](https://itenium-be.github.io/Presentations/)
at which point Claude concurred that it was "programming blind" and that this would solve all our
problems.

It didn't.


### Playwright Tests

So a bit later, I told Claude that even though it now had "eyes" we still weren't making
the progress I was hoping for.

An [obra/superpowers](https://github.com/obra/superpowers) brainstorm later and Claude
was setting up a whole Playwright e2e test suite.

![]({{ "/assets/blog-images/meridian-progress.png" | relative_url }})

This still wasn't working...


### Architectural Direction

The problem in the end was that even though there were now tests,
the whole thing is a black box: the map is drawn on a canvas so even when opening
the test suite with the Playwright UI, the preview is just a blank page.

In the end, I had to step in -- can you imagine that, needing to step in...
It was seriously messing up my vibes man.

Either way, the two things that finally allowed us to make progress:

First, I asked Claude to introduce "**sensing variables**", one of the techniques from
Michael Feathers' excellent book, "Working Effectively with Legacy Code" so that
the tests could scroll and really lock in the behavior.

And second, I told Claude that we need to split the "map movement/zooming" into
a separate component for each scenario so that the calculations & logic are
completely isolated, required for the behavior lock-in. There were a few edge cases
but basically either

- The destination is not visible: zoom out
- The destination is visible: zoom in or move only


### Claude vs Manual Coding

I was talking about the app with a friend while discussing the current state of AI
for development and suddenly it hit me:

While Claude was super efficient for the scaffolding, the Obsidian extractions, backfilling
memories, package selection & integration... For the actual map zooming/movement logic, it was
so inefficient that it would have been faster if I had just coded that part myself.

In all the Vibe Coding I've done since the
[november 2025 inflection point](https://simonwillison.net/2026/Jan/4/inflection/),
that was actually a first...

Or, and this is also a
[recurring thing I've noticed](https://blog.k10s.dev/im-going-back-to-writing-code-by-hand/):
Claude is just bad at architecture, we had been going back-and-forth many, many times on this.
I called Claude out on it multiple times and started suggesting things but not once did Claude
question it's architecture or how to permanently fix the issue at hand.

Which was really simple in the end: decide in which scenario you are and isolate all
zooming/movement logic into a separate component, I mean... Come on...


## Open Sourcing Meridian

And like the other Vibe Coded things Claude has been creating for me these last couple of months,
with just a few hours extra work, we extracted the hardcoded stuff into an extra `story.json`,
created a marketing website with a few example stories and fine-tuned the "triage tool" which
builds the `memories.json` from a folder of pictures.

_"Classic vibe-coded project escalation"_ is what Claude called it, but at least this time, it was
just a few extra hours, not weekends :D


### The Demo Stories

- 🗽 [NY Trip](https://laoujin.github.io/Meridian/NY-Trip/) -- a 5-day New York trip, arrival to departure
- 💘 [Love Story](https://laoujin.github.io/Meridian/Love-Story/) -- how we met, a winter of dates between Leuven and Antwerp


## Getting Started

I used the triage tool to find the memories that weren't marked as #date in Obsidian.
It also contains the scripts used to further enrich the data: weather lookup, extract
GPS coordinates from the pictures and turn that into location names etc.


```bash
git clone https://github.com/Laoujin/Meridian
cd Meridian

# 1. Ingest: read a folder of photos/videos, build the story
cd triage && bun install && bun run triage

# 2. View: scroll-driven timeline with animated map
cd app    && bun install && bun run dev
```



## Why not just use X?

This was one of the blocks Claude created for this blog post.
And I was, oh no, you mean I created something that already existed... ?

- [Polarsteps](https://www.polarsteps.com/): I knew about this one (heck, my mom is on it 😂)
- [Wanderlog](https://wanderlog.com/): This is more like a trip planner
- Google Photos memories: AI generated slop? 😉
- [Mapbox](https://www.mapbox.com/): single map view, not really a trip?


### The pitch

You own the whole thing, you don't have to upload anything to a server of a company
which will take the website down at some point.

But then after she wanted to show it to everyone so I still had to expose it to the internet...

So, in the end, it is OK to gift a Vibe Coded app to your non-technical partner? :D
