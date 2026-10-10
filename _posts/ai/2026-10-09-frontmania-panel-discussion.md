---
layout: post
author: Wouter Van Schandevijl
title: "FrontMania: Panel Discussion"
subTitle: "AI Agents Are Here: Now What Happens to Developers?"
date: 2026-10-09
desc: >
  The FrontMania panel on what happens to developers now that the agents
  are here. What will our job look like in a few years...
bigimg:
  url: frontmania-panel-discussion-big.png
  prompt: "Cinematic dark bedroom at night, alarm clock glowing 3:00, a smartphone buzzing on the nightstand, a human fast asleep under the covers, a small robot sitting on the edge of the bed wide awake with glowing eyes reading a laptop, cold blue moonlight through the window mixed with warm screen glow, moody film still, teal and amber palette --ar 4:1"
  origin: Midjourney
img:
  url: frontmania-panel-discussion-sm.png
  prompt: "Playful editorial illustration of a circle of developers and robots in an office tossing a glowing steaming hot potato to each other, everyone flinching, one robot wearing oven mitts, motion lines, bright flat colors, bold outlines, humorous mid-century cartoon style, warm orange and teal palette"
  origin: Midjourney
categories: ai
tags: [tech-talk]
series: frontmania-2026
---

The FrontMania panel was asked what the developer role will look like in 3 years.

A role that has barely changed in decades... but now the panelists didn't
even dare to look further than six months ahead.

{% include post/image.html file="frontmania-panel-stage.jpg" alt="The panel on stage at FrontMania" desc="Baruch Sadogursky, Talia Asghar, Manfred Steyer and Lucien Immink" maxWidth="800px" %}
{: .hide-from-excerpt }

<!--more-->


<!--
|                                                                                                     | Panelist          | Tagline                                                   |
|-----------------------------------------------------------------------------------------------------|-------------------|-----------------------------------------------------------|
| <img src="{{ site.baseurl }}/assets/blog-images/frontmania-panel-baruch-sadogursky.jpg" width="80"> | Baruch Sadogursky | Head of DevRel, Port.io                                   |
| <img src="{{ site.baseurl }}/assets/blog-images/frontmania-panel-talia-asghar.jpg" width="80">      | Talia Asghar      | Senior Software Engineer at Delivery Hero, GDE Web        |
| <img src="{{ site.baseurl }}/assets/blog-images/frontmania-panel-manfred-steyer.jpg" width="80">    | Manfred Steyer    | Google Developer Expert focusing on Angular               |
| <img src="{{ site.baseurl }}/assets/blog-images/frontmania-panel-lucien-immink.jpg" width="80">     | Lucien Immink     | Principal Consultant at Team Rockstars IT, GDE Web        |
-->

## What will a developer role look like in 3 years

All my life I've heard "IT, it's moving so fast, it's impossible to keep up"
and I've always thought, "No it doesn't, I feel like nothing has changed in decades".

But but but...
- Mobile: You mean exactly the same but on a smaller screen?
- Cloud: IBM was doing this back in the 60s
- Frontend: React is declarative (1963) and reactive (1969)
- NoSQL: Like IMS used for the Apollo program, in 1966?

To see how poorly we've been doing, I recommend
[The Future of Programming](https://www.youtube.com/watch?v=8pTEmbeENF4) by Bret Victor.

<!--block1-->

If an engineer from the 60s looked at the state of software development today, maybe he would be disappointed...

Take that same engineer and throw him into a React codebase, and he's fluent next week.
All his skills transfer perfectly. Take a frontend developer who did a coding bootcamp
or even someone who did a 3 year bachelor and tell them to pick up Assembly or C++
and it will probably take years.

The fundamentals are still useful, and they transfer to everything we do
today. If you only learned React, then you're useless with Vue. If you learned the fundamentals,
you see it's all the same at different levels of abstraction, and you can pick up anything.

But now, with AI... I'm not so sure. Maybe AI is just the next step, like compilers were.
But it feels so much bigger. Then again compilers were also prophesied to virtually eliminate all need for code.

Manfred Steyer's advice at the end of the panel discussion was "learn concepts".
They are not going out of fashion anytime soon, no matter how fast AI keeps advancing.


### In 3 Years? Let's Try 6 Months

Predicting what the developer role will look like in three years... That's anyone's guess now.

Lucien argued we might be heading towards the solo dev team: one person doing PO, analysis, DevOps,
development and testing. Is *that* the 10x developer?

Then Manfred jokingly flipped it around: at a PO conference right now, are they saying *they* can be the solo team
and don't need developers anymore? They probably are.

Isn't that the dream? Finally get rid of all those developers with their big salaries,
arcane language, horrible estimation skills, always telling us they need yet another round of
expensive refactoring because of "technical debt" or some other nonsense.

But POs can't be a solo team, not really, because they don't know security, performance,
architecture or guardrails. They don't know the non-functional requirements or the balance you have to strike between them.
What they can do: build POCs, try out different wireframes, fix small bugs.
(Maybe with an actual human code review there...)

So developers are tha bomb? Well... It works both ways: a dev can't fully take over the role of a PO either.

- Which dev is going to talk with stakeholders about budget? FTEs? Team composition?
- Which dev is going to say no to the coolest project ever (technology-wise)
  and pick the most boring one instead, because that's where the business value is?


## The Hot Potato: Code Reviews

Code reviews came up in pretty much every talk,
and it seemed to me that everyone was just beating around the bush.
I heard sentences like "*We're not reading **all** the lines anymore.*" multiple times that day.

In the before-times, every mature, self respecting team did code reviews. It was a cheap way to catch issues before
they were even merged. There were challenges, sure (ex: discussions about form), but it wasn't just about defect detection.
It also served as knowledge transfer within the team, or a reviewer could pass on some relevant/crucial piece of
tribal knowledge.

But now the AI is creating such huge diffs that reviewing it all, really reviewing it, just isn't feasible anymore.
Reality today is also that the reviewer is often the first human to actually look at the code. Which is just so very rude.

So let's just be honest here: [Human Code Review Will Die in 2026]({% post_url ai/2026-10-10-human-code-review-will-die-in-2026 %}).


## How Juniors Become Seniors

> "Good judgment comes from experience, and experience comes from bad judgment."  
> — Mark Twain (maybe)

That other big question that keeps popping up in AI conversations: how will juniors become seniors when they're no
longer making the mistakes they used to learn from? How will they build experience?

And what about the students? If they are not being taught the fundamentals but syntax in school, what will those skills be worth
when they enter the job market, 3 to 5 years from now. If they learned Java and TypeScript, it's very well possible
that those languages have died before they get to use them. It would be "funny" if, in the end, those languages die before COBOL does 😅

Again those fundamentals... They'll remain necessary: they're what
is going on under the hood. Architecture, for example, is still one of the things that an agent today is
very bad at "growing", as [I've noticed in my vibe-coded side projects]({% post_url ai/2026-05-23-meridian-a-scroll-driven-memory-timeline %}).
Will that change in the coming years... Who knows, but it seems a pretty safe bet (maybe the only bet) that this
is where our profession is going: keeping the codebase DRY, performant, secure, maintainable, ...

At this point, the panel gave the mic to a junior in the room, and she was very positive about the future:
The juniors now have a senior-of-sorts available to them 24/7 to answer all their questions, about
any topic.

Their challenge will be to steer their AI to teach them the right things.


## Over Too Soon

All in all, I heard many interesting things during this panel discussion.
The only problem: it was over so quickly 😅

PS: Lucien Immink's closing advice was "learn Markdown", that's also very true, and a lot easier
to pick up than the fundamentals 😉
