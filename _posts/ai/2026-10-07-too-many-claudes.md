---
layout: post
author: Wouter Van Schandevijl
title: "Too Many Claudes"
subTitle: "Git worktrees and merge queues at FrontMania Utrecht 2026"
date: 2026-10-07
desc: >
  Two coding agents in one checkout is a data race. A lightning talk
  at FrontMania on git worktrees, merge queues and what happens when
  the queue itself becomes the bottleneck. Plus the full three-part
  version we did at itenium and the other sessions I caught. 😎
bigimg:
  url: too-many-claudes-big.png
  prompt: "Wide cinematic matte painting of a fairytale gothic castle at dusk, a single narrow drawbridge leading in, dozens of small brass clockwork robots each carrying a glowing scroll queueing single-file across a misty moat, one robot gatekeeper stamping scrolls at the gate, warm lantern light against cold blue fog, painterly detail, Studio Ghibli meets Gothic illustration, teal and amber palette --ar 4:1"
  origin: Midjourney
img:
  url: too-many-claudes-sm.png
  prompt: "Isometric vintage railway switchyard seen from above, nine parallel tracks each carrying a small steam locomotive, all tracks converging through a single signal box into one main line, a signalman in the tower pulling levers, sepia and brass tones, technical engraving style with soft watercolor wash, 19th century blueprint aesthetic"
  origin: Midjourney
categories: ai
tags: [powershell,autohotkey,sql,angular,testing,excel,git,cheat-sheet,tutorial,windows,product,war-story,regex,debugging,meta,tech-talk,pragmatic-tips,fun,hacking,book-review,synology,mongo]
interesting:
  - url: https://frontmania.com/
    desc: "FrontMania Utrecht"
  - url: https://yegge.ai/essays/fences-not-sandboxes/
    desc: "Steve Yegge: Fences, not Sandboxes"
  - url: https://steve-yegge.medium.com/welcome-to-the-wasteland-a-thousand-gas-towns-a5eb9bc8dc1f
    desc: "Steve Yegge: Welcome to the Wasteland: A Thousand Gas Towns"
---

The FrontMania conference was pretty big on AI, I guess that's to be expected in 2026, the state of IT being as it is...  
I was there to see what others are doing with AI and to give a lightning talk myself, which was also an AI session, disguised as a git talk: "Git Worktrees".

<!--more-->

## My Lightning Talk

When submitting my sessions, I also submitted "Git Worktrees" as a lightning talk but it didn't mention anywhere how many minutes that would be. A lightning talk is 10 minutes right... Nope, turns out that at FrontMania, it's 20!

No one is waiting for a deep-dive on `git worktree` (I think?), so I decided to also cover
merge queues which was, for me, the next bottleneck when working with multiple agents. This decision also squarely positioned the talk in the AI corner ;)

<!--block1-->

## The Dark Factory

A week earlier at itenium, we did a technical session on "The Dark Factory". Which is basically three lightning talks combined.

- Guardrails & Backpressure: The boring part. Probably the most important part.
- Worktrees & Merge Queues: Scaling up the Claude Code chat windows.
- A Graph + A Loop: Do the two previous steps and a Dark Factory suddenly isn't so far fetched anymore.

git-worktrees-dark-factory.png


All three decks are on [dev.itenium.be/Presentations](https://dev.itenium.be/Presentations/).


## Life Was Good

Before the AI craze I lived happily in my terminal:

git-worktrees-before.png


Then Claude entered the scene. `create-react-app`, which was already deprecated for years, finally went out the window for `bun` and `vite` as Claude modernized all my projects and helped me set up all the backpressure and guardrails. For me, live became better still: I was delivering more while simultaneously doing the things I have been postponing for years, you know stuff like replacing `moment.js`...

## Two Claudes, One Checkout

Once I started talking with multiple Claudes, things started breaking

- A Claude doing a `checkout` or a `commit`, interfering with the work of another Claude
- Trying to verify one Claude's work while the others trigger compilation errors and hot reloads

They usually noticed and fixed it. No harm done, but it was wasteful in both time and tokens.


## Enter git worktree

You already have the fix. `git worktree` shipped over a decade ago:
a branch checked out in its own directory. They share the same `.git` folder,
making is vastly superior over a separate clone.

```bash
git worktree add ../my-feature -b feature
git worktree list
git worktree remove ../my-feature
```

A useful thing I learned while creating the session: a `.worktreeinclude`
will copy files (think your `.env`) to the worktree. It's part of the Claude Code
harness or can be installed as a git extension.

At this point you need to move away from `npm` as you don't want to be waiting
on an npm install after each worktree creation... I picked Bun, but switching to `pnpm`
solves the problem as well, without requiring code changes. They both hardlink
the dependencies in your `node_modules` making installation a matter of seconds.


## Main Has Moved

Then things started going out of control. Two Claudes became four, then four became six.

And a new bottleneck showed up: A feature is ready on its worktree, the agent wants to merge to local main but main moved. So the agent does a rebase, build, test... and after all that main moved again. And again. At some point I was looking at 4 agents in exactly that loop...

Until they just gave up, sat there doing nothing and waited for me to give the go ahead "you can merge now". Not very efficient.


## The Merge Queue

The fix is to serialize the landing. Once an agent is done, it drops its branch
on the merge queue and moves on to something else.

Not a new idea: big monorepo teams hit this long before AI.
[Bors](https://github.com/graydon/bors) solved it in 2013,
GitHub has [merge queues](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue)
and GitLab calls it [merge trains](https://docs.gitlab.com/ci/pipelines/merge_trains/).

I'm on GitHub but these were private repos and in that case, merge queues are a paid feature... It was also around that time that I read [Fences, not Sandboxes](https://yegge.ai/essays/fences-not-sandboxes/) by Steve Yegge and instead of just building a merge queue, in true AI Scope Explosion-style, I suddenly found myself building a Dark Factory.
