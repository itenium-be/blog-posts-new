---
layout: post
author: Wouter Van Schandevijl
title: "Yoink: Fancy Claude Code Notification Hooks"
subTitle: "WSL notifications with animated Claude mascots and 9 themes"
date: 2026-06-30
desc: >
  Yoink: custom notification hooks for Claude on WSL. Get beautifully themed pop-ups
  when Claude finishes or needs input, with animated mascots, smart context tokens,
  background agent detection, and configurable themes from unicorn to matrix to dragon. 🦄
bigimg:
  url: yoink-big.png
  origin: Midjourney
  prompt: "Colorful futuristic notification popup cards displaying Claude notification events, multiple UI themes side by side: sakura petals falling, neon matrix digital rain, cosmic space with nebulas, ocean waves, dragon embers over lava, unicorn rainbows, all layered on vibrant gradients with animated mascot characters in joyful poses, terminal window environment in background, high-contrast neon colors, cyberpunk aesthetic, professional UI design, clean composition --ar 4:1"
img:
  url: yoink-sm.png
  origin: Midjourney
  prompt: "Cute Claude AI mascot celebrating with confetti explosion next to a colorful notification card popup, vibrant gradient background, joyful celebrating pose, modern UI design"
interesting:
  - url: https://itenium-be.github.io/Yoink
    desc: "The Yoink marketing website"
  - url: https://github.com/itenium-be/Yoink
    desc: "The Yoink source code"
  - url: https://github.com/itenium-be/Extending-Your-Agent
    desc: "The itenium AI session: Extending Your Agent"
categories: ai
tags: [claude,hooks,notifications,product,war-story,automation,windows]
---

While working on the next itenium AI session "Extending Your Harness", I was working on the slides of
the plugin primitives and hooks are definitely a very important one. You don't ask the model
nicely to run the tests or to adhere to your linting conventions and pray that it actually does...

No! For that kind of backpressure you want to be fully deterministic - with **hooks**!

<!--more-->

## The Marketplace

For the session, I turned the slidev deck into it's own tutorial marketplace + plugin. Not very useful
for actual installation, but useful as a teaching mecanism: the powerpoint repository IS a Claude Plugin!

It contains super handy skills like the `/greeter` which really is more involved as you'd expect,
as it teaches about `$ARGUMENTS`, running commands (`! whoami`), and it even incorporates a dependency
from an external marketplace (to render a fancy ASCII greeting).

<!--block1-->

## The Hook

For the hooks primitive I first added a `PostToolUse` for linting. Because the repository doesn't really
contain much code, this turned out to be a json validator.

```json
"PostToolUse": [{
  "matcher": "Write|Edit",
  "hooks": [{
    "type": "command",
    "command": "${CLAUDE_PLUGIN_ROOT}/hooks/validate-json.sh"
  }]
}]
```

But... That is pretty boring...


## Notifications

Since I need to burn as many tokens as possible, as quickly as possible, I'm typically running several Claude Code
sessions at the same time and back in the olden days when I was still starting Claude from my trusted PowerShell
I had added some quick & dirty notification hooks to inform me when my input was needed somewhere.

Because of PowerShell vs Bash friction, I have since switched to WSL (maybe `CLAUDE_CODE_USE_POWERSHELL_TOOL=1` could
have elevated that pain but I only recently learned of this Claude env variable) and I haven't had notifications since.

## Yoink

So I quickly started Claude-Notify, later renamed to **Yoink** to have super fancy notifications. The usual scope
explosion happened again of course - I mean these days I just know it's going to happen, resistance is futile.

Some interesting features:

- The notification appears on the screen where the Claude Terminal is located at
- Clicking the notification activates that Terminal window
- Displays interesting context like

And then the scope explosion:

- 9 different themes: 🦄, 🐉, 💊, 🌸, 🚀, 🐳, 🌴, 🤖 and 👻
- Animated Claude mascot!!
- 75 carefully selected sounds (sound is optional of course)
- Fully configurable: the themes, the sounds, the colors, gradients, different scenes per theme, the texts (with replacements)
- A `settings-editor.ps1` so you can edit Yoinks `settings.json` and see the result right away
- A marketing website!

### The Demo

Check the marketing website for all 9 themes and the different Claude mascot animations in action!

<video width="648" height="448" controls autoplay muted loop>
  <source src="https://github.com/itenium-be/Yoink/raw/refs/heads/main/site/assets/yoink-unicorn.mp4" type="video/mp4">
</video>


## The Installation

After all that sidetracking, this was still supposed to be part of the AI session,
so actually packaging it as a plugin and exposing it as a marketplace was mandatory :D

```txt
/plugin marketplace add itenium-be/Yoink
/plugin install yoink@yoink-marketplace
```

Or if you're running from a clone, edit your `~/.claude/settings.json`:

```jsonc
"hooks": {
  "SessionStart": [{ "hooks": [{ "type": "command", "command": "bash ~/.claude/yoink/hooks/notify-capture.sh" }] }],
  "Stop": [{ "hooks": [{ "type": "command", "command": "bash ~/.claude/yoink/hooks/notify-fire.sh done" }] }],
  "Notification": [{ "hooks": [{ "type": "command", "command": "bash ~/.claude/yoink/hooks/notify-fire.sh needs-input" }] }]
}
```
