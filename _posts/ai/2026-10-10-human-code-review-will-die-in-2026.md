---
layout: post
author: Wouter Van Schandevijl
title: "Human Code Review Will Die in 2026"
subTitle: "Code Review: The hot potato at FrontMania"
date: 2026-10-10
desc: >
  Every talk at FrontMania tiptoed around code reviews. Nobody reads
  each line of code anymore. Let's stop reading the code and instead
  build the guardrails that make it possible.
bigimg:
  url: human-code-review-will-die-in-2026-big.png
  prompt: "Cinematic dark bedroom at night, alarm clock glowing 3:00, a smartphone buzzing on the nightstand, a human fast asleep under the covers, a small robot sitting on the edge of the bed wide awake with glowing eyes reading a laptop, cold blue moonlight through the window mixed with warm screen glow, moody film still, teal and amber palette --ar 4:1"
  origin: Midjourney
img:
  url: human-code-review-will-die-in-2026-sm.png
  prompt: "Playful editorial illustration of a circle of developers and robots in an office tossing a glowing steaming hot potato to each other, everyone flinching, one robot wearing oven mitts, motion lines, bright flat colors, bold outlines, humorous mid-century cartoon style, warm orange and teal palette"
  origin: Midjourney
categories: ai
tags: [testing,tech-talk]
series: frontmania-2026
interesting:
  - url: https://arxiv.org/pdf/2606.13175
    desc: "The End of Code Review: Coding Agents Supersede Human Inspection (June 2026)"
  - url: https://arxiv.org/abs/2603.22106
    desc: "Margaret-Anne Storey: The Triple Debt Model (technical, cognitive and intent debt)"
extras:
  - url: https://dev.itenium.be/Presentations/
    desc: "Guardrails & Backpressure: the slides"
---


During my [lightning talk at FrontMania]({% post_url ai/2026-10-07-too-many-claudes %}) I said out loud
what I thought the other talks seemed to be sugarcoating:
**Human code review will die in 2026.** Okay maybe 2027, since 2026 ends in 2 months 😉


<!--more-->

## The Hot Potato

"We're not reading *all* the lines anymore." came up talk after talk.

In "Pragmatic Agentic Development", Edward Becx showed a PR with **+1300 -1000** lines
which can basically be generated with a single prompt and a longish coffee break.

But you can't review a PR like that, not without spending considerably more time on it
than it took to create it in the first place.

<!--block1-->

{% include post/image.html file="human-code-review-grampa-simpson.jpg" alt="Grampa Simpson: We used to review every line of code before it went into production" desc="Karthik Hariharan (@hkarthik) on X, Feb 2026" maxWidth="600px" %}

And then the harsh reality: the reviewer is often the first human to actually look at the code.
Which is just so very rude. I hate it when I get AI slop shovelled down my throat; why should I read your AI slop when
you yourself didn't even bother...


## The AI Slop Machine

However, you can't just drop code review and start shipping it all.

In my talk this is assumed to be already in place: backpressure and guardrails.  
It's the boring part. It's the prerequisite, a lot of initial setup and then continuous ongoing tweaking.


### Make No Mistakes

Your first instinct may be to put the guardrails in a `CLAUDE.md`, maybe using Progressive Context
Disclosure to tell it to use `npm test` after writing frontend code, and to point it to the `DOTNET_STYLEGUIDE.md`
before writing C# code.

But non-deterministically trying to fix this is merely a prayer. The LLM might follow your rules,
or it might forget them (Lost in the middle), reason around them, or decide to just plain ignore them
based on one of your prompts or the current phase of the moon.


### Deterministic Hooks

The solution is to take them outside of the LLM context and make them deterministic.
An LLM cannot reason itself out of an exit code.


#### Language Server Protocol

Language Server Protocol (LSP) is natively supported in the Claude Code harness,
set up in under 10min and provides a tight feedback loop for the AI.
Just like an IDE used to display squigglies if you made an error while typing
code, the LSP will inject these errors straight into context as it is writing code.


#### Decide Where You Run What

Run faster checks early, slower ones later.
We've got Claude Hooks, Git Hooks (typically on commit & push) and then
finally the CI/CD pipeline.

You may only want to run the e2e test suite on the CI/CD, the formatter
on `git commit` and the building/linting as a Claude Hook after it finished
writing code. Your mileage will vary.


## What Backpressure do I need

Everything.

Tabs vs spaces. Maybe the simplest of the formatting rules but getting a team to agree on that
was no easy feat. And there were always those that didn't install
the linter, overruled it, or just plain ignored the ruleset they signed off on.  
Three years (months?) later, you open the project and the IDE shows "3000 warnings".

UnitTesting? Who has time for that, we need to ship features. Testing the frontend?
Nah, not needed, our frontend has no logic (yes not even that 2k loc component).

If your hook says 80% test coverage, and that each
lint violation is an error, the agent does not complain, it complies.


### Linters & Formatters

- All the code must look the same, each deviation is an error
- Find every linting rule in existence and if it makes sense for your project (hint: almost all do): make each violation an error
  - Have you heard of [eslint-plugin-unicorn](https://github.com/sindresorhus/eslint-plugin-unicorn)?
    Me neither, but I've enabled all of them.
- Each compilation warning is an error

### Automated Testing

Set up tests: UnitTesting, API Tests, Component Tests, Frontend Tests
- Playwright e2e tests with an actual database (Testcontainers) and actual (Container) or fake (WireMock) dependencies
- Architecture tests with ArchUnit to enforce your project structure
- Pact tests if you're in a MicroService landscape

But that is not enough, you need to enforce Branch Coverage, not Line Coverage, and have a minimum coverage % that breaks the build.

#### Mutation Testing

You now have all these tests in place. But since you're not writing the tests and you're probably not even
looking at them... How do you know what they're worth?

That is where mutation testing comes into play. It makes systematic changes to your codebase (called mutations) and
runs the test suite against each change. If all tests remain green, that behavior is not locked in by a test; the mutation survived.
You get a report at the end which gives you an indication of how good the test suite actually is.

```ts
// Original
if (x > 0) {}

// Mutants
if (x >= 0) {}
if (x <= 0) {}
if (true) {}
if (false) {}
```

[Stryker](https://stryker-mutator.io/) is open-source and probably exists for your programming language.


### Others

If a CVE is found in one of your dependencies, it's an error. This is a tricky one because every time you open a project
there is a chance the build is broken because something was discovered. At that point, I just ask the agent to fix it but using
Renovate/Dependabot would be a better solution there.

Stop the AI from committing API keys: add `gitleaks`.

Performance: this is something I've yet to implement but it's something that can be guarded
deterministically:
- Put a few thousand, million, ... records in the database and run tests against the API.
- Run many "random" Playwright sessions in parallel and see how snappy the UI remains.



## Guarding The Guardrails

The LLM is trained to be "helpful". It *will* get creative with your guardrails:

- Commit and push with `--no-verify`
- Add a `// eslint-disable-next-line`
- Just plain turn off a certain rule

So what are your guardrails worth if your codebase is just riddled with `eslint-disable`
and the LLM is silently turning off another rule each week...

Part of the ongoing work on the backpressure is ensuring that you further
constrain it.

- A `PreToolUse` hook to block `--no-verify`, protect `eslint.config.js` etc
- `noInlineConfig` to prohibit `// eslint-disable-next-line`

At that point the AI can't work around it anymore but... Sometimes it really makes sense to turn off a rule
in a certain scenario. Uhoh...

A balance needs to be struck between "getting shit done" vs "it going off the rails".

So we need something like:
- You can turn off these rules as you see fit: `unicorn/no-null`, `unicorn/prevent-abbreviations`
- You are not allowed to turn off these rules no matter what: `@typescript-eslint/no-explicit-any`, `no-eval`
- You are allowed to turn these rules off but only with explicit approval of a human: `react-hooks/exhaustive-deps`

And then implement deterministic checks, gates and ratchets for that.

I did mention that this is what you'll be spending most time on right?


### Compounding Engineering

> AI engineering makes you faster today. Compounding makes you faster tomorrow, and each day after  
> — Kieran Klaassen

Keep your prompts DRY. If you correct the agent on the same thing twice,
it shouldn't be a third prompt, it should be a guardrail, so it can't recur:

- `<select>` isn't themeable → it goes in `no-restricted-syntax`
- `<a>`/`<button>` without a pointer cursor → a frontend test

Every mistake makes the harness a little stronger.



## So... Code Review?

With all that in place, what is left for a human to look at?

- Do you care about the CSS? As long as it looks exactly like you want?
- Do you care about the frontend? As long as it does exactly what you want?
- Do you care about the database? As long as it's performant and normalized?

**I don't care and I'm not looking.** (maybe do keep an eye on the database.)

The backend? Uhm... I'm not sure. But I know I do care about:

| Concern      | The question                        |
|--------------|-------------------------------------|
| Security     | Does that really work as intended?  |
| API Surface  | How chatty or chunky are we?        |
| Architecture | Can we keep building at this speed? |

Claude is bad at security and at growing an architecture. I've been burned by both:
a homelab service that was supposed to be `.lan`-only turned out to be publicly reachable,
and on [Meridian]({% post_url ai/2026-05-23-meridian-a-scroll-driven-memory-timeline %}),
a very simple app, I ended up dictating the architecture because Claude kept running in circles.
And the API surface is where cost and performance live.

But how some function or class is implemented? `/care`.

## So not looking at the code then?

Aside from reading the security, architecture and API surface code before a handoff,
or before a larger changes goes to production, yeah...  
And that is a good idea? Uhm, I sure hope so, because, one sec:

> "Claude, how many lines of code has this Dark Factory created so far?"  
> About 200k loc production code and 200k loc test code

Only 400k loc, that's still manageable I guess :D  
But that's in just three months, and I actually expect the rate of code generation
to increase, so if we keep going like this...

| Horizon   | Flat 120k/mo | Output +10%/mo | Output +25%/mo |
| --------- | -----------: | -------------: | -------------: |
| Today     |        0.37M |          0.37M |          0.37M |
| +3 mo     |        0.73M |          0.81M |          0.94M |
| +6 mo     |        1.09M |          1.39M |          2.06M |
| +12 mo    |        1.81M |          3.19M |          8.5M  |
| +24 mo    |        3.25M |            12M |          127M  |
| +5 years  |        7.57M |           401M |          392B  |
| +10 years |        14.8M |           122B |          255Q  |

Yeah, those are some scary numbers.

To be honest, can it really be worse than your typical enterprise app after
a few years of development? At my last gig they had about 5M loc, and everything
was legacy that each team had to support but didn't create themselves (and yet
somehow they were all working there for over a decade...)

It's crazy how I've been obsessed with clean, maintainable, performant code for
the 20+ years I've been doing this professionally and now in just 1 year I'm like
*"It'll be ok, whatever"* 😱


## 2026? Or 2036?

Your average enterprisey IT team is starting to pick up AI-generated code
but they haven't invested in guardrails, so typically, their reality is:

- No linting or thousands of warnings
- Repositories with low or even 0% code coverage
- No e2e testing, no Testcontainers, no mutation testing, ...

So realistically, human code review will probably die in 2036 😂



## Accountability

> We are left alone, without excuse. That is what I mean when I say that man is condemned to be free.  
> — Jean-Paul Sartre (quoted in "Pragmatic Agentic Development")

Both the FrontMania panel and the Pragmatic talk landed on the same point: **the human is accountable**.
You shipped it, you own it. For me, this was never even a question.


### Who Gets Woken Up At 3AM?

It's 3AM and production crashed. You're accountable, so it's your phone that rings.

Unless you're brave enough... Agents don't sleep and they react faster than
a human can look up your phone number.

| Step                          | Agent can do it?   |
|-------------------------------|--------------------|
| Watch production              | Possible today     |
| Find and fix the bug          | Possible today     |
| Create the PR                 | Possible today     |
| Deploy the fix to production  | Hmm... 🙈          |

Danger danger!? The future? Let's just do it?
