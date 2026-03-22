---
layout: post
author: Van Schandevijl Wouter
title: "Vibe Coding the SkillForge"
subTitle: "The 2026 itenium AI Bootcamp"
date: 2026-03-18
categories: trends
tags: [product,fun]
bigimg:
  url: ai-bootcamp-big.png
  origin: Nano Banana
img:
  url: ai-bootcamp-sm.png
  origin: Nano Banana
desc: >
  The skill matrix @ itenium is currently an Excel. This is obviously
  unacceptable for an IT consultancy, enter "SkillForge" our custom
  app where we "forge our skills".
interesting:
  - url: ""
    desc: ""
  - git: "itenium-be/Bootcamp-AI"
    desc: "Itenium bootcamp 2026 - L&D Platform creation source code"
  - git: "itenium-be/Bootcamp-AI-Dashboard"
    desc: "Dashboard for the 2026 itenium AI SkillForge Bootcamp: Hall of fame, team statistics"
  - git: "itenium-be/Bootcamp-AI-Resources"
    desc: "Team pictures, certificates, intro powerpoint, ..."
---

The skill matrix at itenium is currently an Excel file.

For an IT consultancy, this is obviously unacceptable. The cobbler's children
have no shoes, the mechanic drives a rust bucket, and the IT consultancy
tracks skills in a spreadsheet.

Enter **SkillForge**: our custom app where we "forge our skills."

<img src="{{ '/assets/blog-images/ai-bootcamp-favicon.png' | relative_url }}" width="80"
  style="margin-right: 8px; float: left" alt="SkillForge fav icon"><span style="color: #828282; font-style: italic">Empower your team with continuous learning. Track progress, manage courses, and build skills together.  
-- CEO Steven Robijns, moments before authorizing $1200 in AI token spend</span>


<!--more-->

## The Teams

Six teams. Six ridiculous names. Six different interpretations of the backlog.

![The participating teams]({{ "/assets/blog-images/ai-bootcamp-teams.png" | relative_url }})

| Team              | Nickname                    | Vibe                                 |
|-------------------|-----------------------------|--------------------------------------|
| **Obsidian**      | The Hallucination Hunters   | Chasing phantom features             |
| **Royal Purple**  | The Tab Tab Tab Engineers   | Automation over hesitation           |
| **Teal**          | The Prompt & Pray Engineers | Minimal tokens, maximum hope         |
| **Crimson**       | The Yolo Deployers          | 27,000 lines of code. 18 features.   |
| **Emerald**       | The Token Burners           | Burned bright. Won everything.       |
| **Midnight Blue** | The Main Branch Pushers     | No Staging. No fear.                 |

<!--block1-->

### Everyone

Everyone participated in this vibe coding exercise. And by everyone, we do mean *everyone*.
The backoffice staff. The people who normally recoil at the sight of a terminal.
The ones who think "git" is something you say when frustrated.

![Backoffice Coding]({{ "/assets/blog-images/ai-bootcamp-non-technical-vibing.png" | relative_url }} "Backoffice Coding")

What could possibly go wrong.

They all got Claude Code accounts. They all started prompting. Some of them
even merged code.

The developers watched in a mixture of horror and fascination as
non-technical colleagues casually asked Claude to "add a button that
does the thing" and... it worked?

Sort of.


## The Application

<img src="{{ '/assets/blog-images/ai-bootcamp-logo.png' | relative_url }}" alt="SkillForge Logo" style="float: left; margin-right: 20px">
We set up a React 19 + .NET 10 + Postgres application. The stack was modern,
the ambitions were high, and the Excel file was about to become obsolete.

SkillForge was designed to be the ultimate L&D platform for consultants, the PRD had 43 functional requirements:

- User management with role-based access
- Skill catalogue with proficiency levels and prerequisites
- Personalized learning roadmaps
- Goal tracking with coach validation


## The Guardrails

The whole thing was vibe coded with Claude Code, but we're not
*complete* animals. As responsible adults, guardrails were set up to prevent the AI from shipping
absolute chaos to production.

{% include github-stars.html url="eslint/eslint" desc="Find and fix problems in your JavaScript code." %}
{% include github-stars.html url="typicode/husky" desc="Git hooks made easy. Pre-commit validation." %}
{% include github-stars.html url="microsoft/playwright" desc="E2E testing. Because someone has to check if this works." %}
{% include github-stars.html url="prettier/prettier" desc="Prettier is an opinionated code formatter." %}
{% include github-stars.html url="webpro-nl/knip" desc="✂️ Knip it before you ship it!" %}
{% include github-stars.html url="vitest-dev/vitest" desc="Next generation testing framework powered by Vite." %}
{% include github-stars.html url="nunit/nunit" desc="NUnit Framework" %}
{% include github-stars.html url="nsubstitute/NSubstitute" desc="A friendly substitute for .NET mocking libraries." %}
{% include github-stars.html url="testcontainers/testcontainers-dotnet" desc="A library to support tests with throwaway instances of Docker containers" %}
{% include github-stars.html url="dotnet/roslynator" desc="Roslynator is a set of code analysis tools for C#, powered by Roslyn." %}

<br>

<img src="{{ '/assets/blog-images/ai-bootcamp-great-code.png' | relative_url }}" style="margin-right: 8px; float: left" alt="SkillForge logo">
The idea was simple: Claude Code does the heavy lifting with a [very small `CLAUDE.md`](https://medium.com/@addyosmani/stop-using-init-for-agents-md-3086a333f380) instructing it to
implement everything in [red/green TDD](https://simonwillison.net/guides/agentic-engineering-patterns/red-green-tdd/). Every PR must pass linting, tests, and code review. In theory, this prevents disaster.

In practice... well, ...

<div style="clear: both; margin-bottom: 8px"></div>



## The Dashboard

Because what's a competition without a scoreboard...
Teams could watch their token count tick up in real-time. Nothing motivates
quite like seeing your AI bill climb while your feature count stays flat.

- **Tokens burned**: the true measure of effort
- **Tests passing**: the true measure of... something working?
- **PRs merged**: the true measure of not breaking main
- **Lines added**: the true measure of nothing, as Team Crimson proved

We vibe coded the dashboard, with the Competence Coaches improving the dashboard during the
bootcamp, which resulted in some weird discrepancies like the biggest commit (lines added) being bigger than
the total amount of lines added of the entire team, and also the dashboard being down for several hours.
Maybe we should have had an AI harness for the dashboard as well? Naah...

{% include post/image.html file="ai-bootcamp-leaderboard.png" alt="The Dashboard" desc="The cleaned up dashboard (with vibed issues fixed;)" maxWidth="800px" %}


## Tokens Burned

**Total burned**: ~$1200

That's roughly $35 per person. Or, as we prefer to think of it: the cost of
one really awkward team dinner, but instead we got a functioning application
and excellent blog post material.

### Biggest Spender

As can be seen on the dashboard, Onur was leading in the "most tokens burned" category,
he was one of the participants whom took the "Tips & Tricks" from the intro powerpoint
to heart and was using `git worktree`s.

The rest of his team had other ideas on what to do while waiting for Claude Code to finish hallucinating
non-existent APIs however, [they created a few mini games]({{ 'ai-bootcamp-mini-games.MOV' | relative_url }})!

### Deploy Panic

A frantic game where you try to ship features while
everything is on fire. Surprisingly accurate simulation.

{% include post/image.html file="ai-bootcamp-deploy-panic.png" alt="Mini game deploy panic" desc="Friday 16:58 — Client is waiting — Boss is watching — Jenkins is judging you" maxWidth="800px" %}

You can [play Deploy Panic]({{ '/assets/blog-images/ai-bootamp-deploy-panic.html' | relative_url }}) @ itenium right now!

### Itenium Runner

An endless runner where you dodge obstacles.
The obstacles are bugs. The runner is your sanity. [Play Itenium Runner]({{ '/assets/blog-images/ai-bootcamp-itenium-runner.html' | relative_url }}) now!

{% include post/image.html file="ai-bootcamp-itenium-runner.png" alt="Mini game itenium runner" desc="It is rumoured that this game was created with just 2 prompts" maxWidth="800px" %}

### More Waiting

Others had even other ideas on what to have Claude do, including adding memes to their SkillForge application.
I didn't even know Claude could create memes ;)

![Memes were created]({{ "/assets/blog-images/ai-bootcamp-mike-meme.png
" | relative_url }})



## The Winners

**Team Emerald**, _The Token Burners_ were selected by Claude as the winning team
based on [evaluate-teams.md](https://github.com/itenium-be/Bootcamp-AI-Dashboard/blob/master/runner/evaluate-teams.md) which was, obviously, also written by Claude. The snake eats its own tail.

![The winning team logo]({{ "/assets/blog-images/ai-bootcamp-the-token-burners.png" | relative_url }})

> Emerald is the clear winner with near-complete PRD implementation. They nailed the coaching workflow: goal assignment with deadlines, readiness flags that track aging (days since raised), live session mode with focused validation view, and immutable audit trails. The CSV-based skill seeding is elegant and production-ready. Coach dashboard includes 21-day inactivity detection with visual highlighting. Activity history tracks validations, goal creation, flag raises, and resource completions as a timeline.

They went home with the **Certificate of Legendary Achievement**

![Certificate for the winning team]({{ "/assets/blog-images/ai-bootcamp-certificate.png" | relative_url }})



### The Runner Up

The final dashboard was very **Crimson** colored with most commits, largest commit and most churn, somehow they still managed to score the least amount of points on the team evaluations. We're not sure how it happened, but it's just not possible that Claude made a mistake somewhere so, yeah, ...


### Final Team Scoring

| Place | Team             | Score    | Verdict |
|-------|------------------|----------|---------|
| 🥇   | **Emerald**      | 169/200  | **Winner** - Only feature-complete implementation |
| 🥈   | **Obsidian**     | 118/200  | Strong foundation, needs goals/coaching |
| 🥉   | **Teal**         | 114/200  | Best code quality, needs more features |
| 4th   | **RoyalPurple**  | 112/200  | Great skill data, stubbed coaching |
| 5th   | **MidnightBlue** | 107/200  | Clean skills/resources, no goals |
| 6th   | **Crimson**      | 99/200   | LMS foundation, not a coaching platform |


## The Takeaway

Can you vibe code a production application in one day?

![AI Took our Jobs]({{ "/assets/blog-images/ai-bootcamp-compilers.jpg" | relative_url }})


**It Depends** :)

With the right guardrails (linting, tests, PR reviews), AI assistance
(Claude Code), and motivated teams (competition + leaderboards), you can
go from "Excel skill matrix" to "functional React/.NET application" in
about 8 hours.

But was it worth the tokens?

We got an app, a blog post, the memory of watching non-technical
staff successfully merge code, new memes and 2 mini games.

So yes, definitely ;)

{% include post/image.html file="ai-bootcamp-layoffs.jpg" alt="The Layoffs" desc="We're still safe -- for now ;)" maxWidth="700px" %}
