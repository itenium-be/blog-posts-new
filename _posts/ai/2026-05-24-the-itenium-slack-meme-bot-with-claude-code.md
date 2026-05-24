---
layout: post
author: Wouter Van Schandevijl
title: "The itenium Slack Meme Bot® : with Claude Code?"
subTitle: "Three years later, the impossible is now just a one-line prompt."
date: 2026-05-24
desc: >
  Three years ago I tried to make ChatGPT build our Slack Meme Bot
  and gave up because it didn't seem it was ever going to get done.
  Today with Claude Code, it got built and worked straight away.
bigimg:
  url: the-itenium-slack-meme-bot-with-claude-code-big.png
  prompt: "two robots in front of a brick wall labelled 'Slack' — on the left a 2023 robot stuck at the wall holding a confused python error printout, on the right a 2026 robot already past the wall confidently handing a glowing framed meme to a smiling slack logo, a three-year arrow between them, comic style, vibrant colors, dynamic composition --ar 4:1"
  origin: Midjourney
img:
  url: the-itenium-slack-meme-bot-with-claude-code-sm.png
  prompt: "a victorious friendly robot handing a glowing framed meme to a smiling slack logo, comic style, vibrant colors"
  origin: Midjourney
categories: ai
tags: [product,fun,war-story,ai]
series: slack-meme-poster
extras:
  - url: https://github.com/itenium-be/slack-meme-poster-ai
    desc: "Slack Meme Poster AI building attempts"
---

Three years ago I tried to get ChatGPT to rebuild the itenium Slack Meme Bot
and gave up halfway through because the LLM just wasn't up for the task.

This week I asked Claude Code. A brainstorm with a few clarifying questions,
a quick spec, a few prompts to match my infrastructure, and the resulting code worked
on my first test.


<!--more-->


In 2023 I ended the blog post with _"It is a gadget, nothing more."_ and
_"I feel old, bitter and out of touch"_. At the time, that was about right,
the whole exercise felt like babysitting a confused junior who copy-pasted from Stack Overflow
without bothering to check if it worked.


## Claude Code + Superpowers

The prompt:

> check current repo. I tried to build the slack-meme-poster back in 2023. AI failed doing
> so. I was really disappointed. Also see [this blog post]({% post_url ai/2023-07-05-ai-the-slack-meme-bot %})
>
> now, we're three years later and at this point I'm feeling very confident
> that you should be able to just build this...

<!--block1-->

This triggered a [obra/superpowers](https://github.com/obra/superpowers) brainstorm
which asked me:

Q: Which implementation language?  
A: You decide the language (it picked **Python**)

Q: How should we verify it actually works before declaring done?  
A: Do whatever you think is best. (it picked **TDD**)

Q: Do you have Slack credentials ready to test against?  
A: We're going to rebuild the existing thing using a WebHook. Have an .env file and a docker compose.

Q: Webhooks can't upload local files. How do you want to handle the image?  
A: The selected file is moved to `meme/already-sent`. Part of the docker-compose
is a service that services these files. The url is also in the .env. (it picked **nginx**)

It created the spec, I skimmed it, fixed one wrong assumption about the folder structure and it built
a working version after. Then a few follow up prompts so that I could deploy it on my existing infra.


## So What Changed?

- **Agentic**: No copy pasting, Claude creates all the files, wires them up and tells me how to configure and run it
- **Workflow**: Skill frameworks guide Claude so that it doesn't just start building something
- **TDD**: Probably a bit overkill for something this simple but everything that could be tested, was tested
- **Tooling**: Can actually run bash, docker, python commands
- **Human steers**: Claude can't know how my ISP router forwarding is set up but it wired everything correctly following my instructions perfectly


## Conclusion

So the answer to _"Can AI build the Slack Meme Bot in 2026?"_ is just:
**yes**. A brainstorm, a quick spec, a few infrastructure-matching prompts,
and an hour later the first meme was posted on Slack.

The version I built manually in 2023 took me longer with a lot more swearing.

In 2026 I'm older still, but somehow less bitter, and quite a bit less out of touch 😉
