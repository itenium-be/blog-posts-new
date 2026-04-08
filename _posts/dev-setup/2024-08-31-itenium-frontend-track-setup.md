---
layout: post
author: Wouter Van Schandevijl
title: "Frontend Track Setup"
subTitle: "Setup your machine for the itenium Frontend Track"
date: 2024-08-31
desc: >
  Setting up Node and Visual Studio Code
  with TypeScript and Bun (or Jest) for the
  itenium Frontend Track sessions!
bigimg:
  url: frontend-track-big.png
  origin: Midjourney
  prompt: "frontend web development ui"
img:
  url: frontend-track.png
  desc: "The itenium frontend track"
  origin: Midjourney
  prompt: "the frontend track"
categories: dev-setup
tags: [tutorial,windows,testing,debugging]
extras:
  - githubproject: https://github.com/itenium-be/Frontend-Track
    githubtext: "Template code repository"
toc:
  title: Frontend Track Setup
  icon: icon-javascript
last_modified_at: 2026-04-08 00:00:00 +0200
updates:
  - date: 2026-04-08 00:00:00 +0200
    desc: "Add modern alternatives: pnpm & Bun (our new default), winget, fnm. Removed obsolete VSCode, Chrome extensions."
socials:
  linkedin: "https://www.linkedin.com/posts/itenium_itenium-keeponlearning-itdevelopment-activity-7237037256333565954-ie53"
  instagram: "https://www.instagram.com/p/C_fbgjPN04J/"
  twitter: "https://x.com/itenium_be/status/1831271037679386647"
  facebook: "https://www.facebook.com/share/p/L2NYz9vvJNfJ1uYy/?mibextid=oFDknk"
---

Q: How do you install Node?  
A: Well, you don't!
{: .notice--info}

You install NVM (Node Version Manager) because
every project uses a different version and
they are not always that compatible!

<!--more-->

## Node Version Manager

Install [nvm](https://github.com/coreybutler/nvm-windows) with [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/):

```powershell
winget install CoreyButler.NVMforWindows
```

Or with [chocolatey](https://chocolatey.org/install):

```powershell
choco install nvm
```

NVM usage typically requires an Administrative prompt.

```powershell
# List help
nvm

# List available node versions
nvm list available

# Use a specific node version
nvm install 22.1.0
nvm use 22.1.0
```

An alternative to nvm is [fnm](https://github.com/Schniz/fnm) (Fast Node Manager), which is
significantly faster and doesn't require an admin prompt:

```powershell
winget install Schniz.fnm

fnm install 22
fnm use 22
```

The Github repo of the session lists the Node version used at the top of the README.


<!--block1-->


## Visual Studio Code

Looks like it's already 5 years since I switched from Sublime Text 3 to Visual Studio Code.
While all attendees can obviously pick whichever IDE they fancy, if you don't have strong
convictions about your IDE for frontend development (yet), you can't go wrong with VSC.

Learning to use your IDE well is Pragmatic Tip 22. Learn those shortcuts, macro's, install
fancy plugins, learn how to work with multiple cursors etc. You'll be typing quite a lot
during your career, better do it elegantly!

Previous blog posts on setting up and learning about Visual Studio Code:

- [Pragmatic Tip #22 : Use A Single Editor Well](https://itenium.be/blog/dev-setup/pragmatic-tip-22-use-a-single-editor-well/)
- [VSCode: Editor Settings and Shortcuts](https://itenium.be/blog/dev-setup/vscode-editor/)


### Syncing Settings

Back when those posts were written, Visual Studio Code didn't have a builtin option
to sync your settings so I did it with our [dotfiles](https://github.com/Laoujin/dotfiles). But now it's just a
[menu option](https://code.visualstudio.com/docs/editor/settings-sync) away.

![Turn on sync in Visual Studio Code]({{ "/assets/blog-images/frontend-track-turn-on-sync.png" | relative_url }} "Turn on sync in Visual Studio Code")

Especially useful when you have an installation on your home and work laptops, or when
you change projects!

### Plugins

Each itenium session lists its own set of suggested Visual Studio Code plugins
in the README.

If you start doing "Angular" development, or "Flutter", just `Control + Shift + X` and search for it,
you see a plugin with a few million downloads? It's probably worth checking out.

You can't go wrong with these for frontend development:

| Plugin                             | Installs | Description                                             | Repo       |
|------------------------------------|---------:|---------------------------------------------------------|------------|
| **JavaScript**                     |
| [Toggle Quotes][Toggle-Quotes]     |     260k | Quote toggler to cycle through " ' and `                | [Github][Toggle-Quotes-Repo]
| [Live Server][Live-Server]         |      53M | Local Server with live reload                           | [Github][Live-Server-Repo]
| [Live Preview][Live-Preview]       |      12M | Microsoft's alternative to Live Server                  | [Github][Live-Preview-Repo]
| **Importing**                      |
| [npm Intellisense][npm-Intel]      |       8M | Autocompletes import statements                         | [Github][npm-Intel-Repo]
| [Import Cost][Import-Cost]         |       4M | Display import/require package size                     | [Github][Import-Cost-Repo]
| [Path Intellisense][Path-Intel]    |      13M | Autocompletes filenames                                 | [Github][Path-Intel-Repo]
| **CSS**                            |
| [Tailwind IntelliSense][Tailwind]  |      14M | Autocomplete, linting, previews for Tailwind CSS        | [Github][Tailwind-Repo]
| [CSS Peek][CSS-Peek]               |       6M | Peek and Go to definition for CSS                       | [Github][CSS-Peek-Repo]
| [CSS Completion][CSS-Compl]        |       8M | IntelliSense for CSS class names                        | [Github][CSS-Compl-Repo]
| **Styling**                        |
| [EditorConfig][EditorConfig]       |      10M | Automatically follow `.editorconfig`                    | [Github][EditorConfig-Repo]
| [Prettier][Prettier]               |      48M | Prettier code formatter                                 | [Github][Prettier-Repo]
| [ESLint][ESLint]                   |      37M | ESLint code formatter                                   | [Github][ESLint-Repo]
| [Indent-Rainbow][Indent-Rainbow]   |       8M | Makes indentation easier to read                        | [Github][Indent-Rainbow-Repo]
| [Better Comments][Better-Comments] |       7M | Make those TODOs stand out                              | [Github][Better-Comments-Repo]
| **Other**                          |
| [Markdown All In One][Markdown]    |       9M | All you need to write Markdown                          | [Github][Markdown-Repo]
| [Git Blame][Git-Blame]             |       2M | Git blame information in the status bar                 | [Github][Git-Blame-Repo]
| [Git History][Git-History]         |      12M | Git log, file history, compare branches or commit       | [Github][Git-History-Repo]
| [Gitlens][Gitlens]                 |      34M | Supercharge Git                                         | [Github][Gitlens-Repo]
{: .table-code}



[Toggle-Quotes]: https://marketplace.visualstudio.com/items?itemName=BriteSnow.vscode-toggle-quotes
[Toggle-Quotes-Repo]: https://github.com/BriteSnow/vscode-toggle-quotes
[Live-Server]: https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer
[Live-Server-Repo]: https://github.com/ritwickdey/vscode-live-server
[Live-Preview]: https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server
[Live-Preview-Repo]: https://github.com/microsoft/vscode-livepreview
[npm-Intel]: https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense
[npm-Intel-Repo]: https://github.com/ChristianKohler/NpmIntellisense
[Import-Cost]: https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost
[Import-Cost-Repo]: https://github.com/wix/import-cost
[Path-Intel]: https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense
[Path-Intel-Repo]: https://github.com/ChristianKohler/PathIntellisense
[Tailwind]: https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss
[Tailwind-Repo]: https://github.com/tailwindlabs/tailwindcss-intellisense
[CSS-Peek]: https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek
[CSS-Peek-Repo]: https://github.com/pranaygp/vscode-css-peek
[CSS-Compl]: https://marketplace.visualstudio.com/items?itemName=Zignd.html-css-class-completion
[CSS-Compl-Repo]: https://github.com/Zignd/HTML-CSS-Class-Completion
[EditorConfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[EditorConfig-Repo]: https://github.com/editorconfig/editorconfig-vscode
[Prettier]: https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
[Prettier-Repo]: https://github.com/prettier/prettier-vscode
[ESLint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[ESLint-Repo]: https://github.com/Microsoft/vscode-eslint
[Indent-Rainbow]: https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow
[Indent-Rainbow-Repo]: https://github.com/oderwat/vscode-indent-rainbow
[Better-Comments]: https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
[Better-Comments-Repo]: https://github.com/aaron-bond/better-comments
[Markdown]: https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
[Markdown-Repo]: https://github.com/yzhang-gh/vscode-markdown
[Git-Blame]: https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame
[Git-Blame-Repo]: https://github.com/Sertion/vscode-gitblame
[Git-History]: https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory
[Git-History-Repo]: https://github.com/DonJayamanne/gitHistoryVSCode
[GitLens]: https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
[GitLens-Repo]: https://github.com/gitkraken/vscode-gitlens


## Browser Extensions

Unlike your preferred IDE, while you can use whichever browser you like for your day-to-day development,
you do need all browsers installed so that you can at least do some initial testing in Chrome, Firefox
and Edge; and maybe in a few less known ones, like Opera.  
This can also come in handy when testing something for which you need users with different roles. Have
the Admin use Chrome and the regular user Firefox and you can perform tests without having to logout/login
all the time.

That being said, the browser extensions are available for pretty much all browsers:

| Plugin                                | Installs | Rating    | Description                                               | Repo       |
|---------------------------------------|---------:|-----------|-----------------------------------------------------------|------------|
| **Libraries**                         |
| [Redux][Redux]                        |       1M | 4.6 (700) | Current state of the store, time travel & more            | [Github][Redux-Repo]
| [Angular][Angular]                    |     300k | 3.9 (160) | Angular specific debugging and profiling capabilities     | [Github][Angular-Repo]
| [React][React]                        |       4M | 4.0 (1.6k)| ⚛️ Components" and "⚛️ Profiler Tabs                      | [Github][React-Repo]
| [Vue][Vue]                            |       2M | 4.2 (2.1k)| Debug Vue.js applications                                 | [Github][Vue-Repo]
| **Tools**                             |
| [Clear Cache][Clear-Cache]            |     900k | 4.5 (1.1k)| Powerful, user-friendly browser data management           | [Website][Clear-Cache-Repo]
| [JSON Formatter][Json]                |       2M | 4.6 (1.8k)| Make JSON easy to read                                    | [Github][Json-Repo]
| [ModHeader][ModHeader]                |     700k | 3.2 (1.1k)| Modify HTTP request/response headers, redirect URLs       | 
| [Requestly][Requestly]                |     200k | 4.4 (1.2k)| Redirect URLs, Modify HTTP Headers, Mock APIs, ...        | [Github][Requestly-Repo]
| [Lightshot][Lightshot]                |       2M | 4.4 (6.9k)| Screenshot tool
| [Wappalyzer][Wappalyzer]              |       2M | 4.6 (1.9k)| Technology profiler                                       | [Github][Wappalyzer-Repo]
| [Web Developer][Web-Dev]              |       1M | 4.5 (2.8k)| Toolbar with various web developer tools                  | [Github][Web-Dev-Repo]
| **Rulers**                            |
| [Page Ruler][Page-Ruler]              |     400k | 3.9 (77)  | Measure page elements size in pixel
| [PixGrid Ruler][PixGrid]              |       1M | 4.1 (12)  | Your Pixel-Perfect Ruler
| [Dimensions][Dimensions]              |     200k | 4.1 (453) | A tool for designers to measure screen dimensions         | [Github][Dimensions-Repo]
| **Color Pickers**                     |
| [ColorZilla][ColorZilla]              |       4M | 4.6 (3.8k)| Eyedropper, Color Picker, Gradient Generator              | [Website][ColorZilla-Repo]
| [ColorPick-Eyedropper][ColorPick-Eye] |       2M | 4.2 (1.2k)| A zoomed eyedropper & color chooser
{: .table-code}



[Redux]: https://chromewebstore.google.com/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd
[Redux-Repo]: https://github.com/reduxjs/redux-devtools
[Angular]: https://chromewebstore.google.com/detail/angular-devtools/ienfalfjdbdpebioblfackkekamfmbnh
[Angular-Repo]: https://github.com/angular/angular/tree/main/devtools
[React]: https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi
[React-Repo]: https://github.com/facebook/react
[Vue]: https://chromewebstore.google.com/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd
[Vue-Repo]: https://github.com/vuejs/devtools
[Clear-Cache]: https://chromewebstore.google.com/detail/clear-cache/cppjkneekbjaeellbfkmgnhonkkjfpdn
[Clear-Cache-Repo]: https://clearcache.io
[ColorZilla]: https://chromewebstore.google.com/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp
[ColorZilla-Repo]: https://www.colorzilla.com/
[ColorPick-Eye]: https://chromewebstore.google.com/detail/colorpick-eyedropper/ohcpnigalekghcmgcdcenkpelffpdolg
[Page-Ruler]: https://chromewebstore.google.com/detail/page-ruler/jcbmcnpepaddcedmjdcmhbekjhbfnlff
[PixGrid]: https://chromewebstore.google.com/detail/pixgrid-ruler/glkplndamjplebapgopdlbicglmfimic
[Json]: https://chromewebstore.google.com/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa
[Json-Repo]: https://github.com/callumlocke/json-formatter
[Dimensions]: https://chromewebstore.google.com/detail/dimensions/baocaagndhipibgklemoalmkljaimfdj
[Dimensions-Repo]: https://github.com/mrflix/dimensions
[Lightshot]: https://chromewebstore.google.com/detail/lightshot-screenshot-tool/mbniclmhobmnbdlbpiphghaielnnpgdp
[Wappalyzer]: https://chromewebstore.google.com/detail/wappalyzer-technology-pro/gppongmhjkpfnbhagpmjfkannfbllamg
[Wappalyzer-Repo]: https://github.com/projectdiscovery/wappalyzergo
[Web-Dev]: https://chromewebstore.google.com/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm
[Web-Dev-Repo]: https://github.com/chrispederick/web-developer/
[ModHeader]: https://chromewebstore.google.com/detail/modheader-modify-http-hea/idgpnmonknjnojddfkpgkljpfnnfcklj
[Requestly]: https://chromewebstore.google.com/detail/requestly-intercept-modif/mdnleldcmiljblolnjhpnblkcekpdkpa
[Requestly-Repo]: https://github.com/requestly/requestly


## The Project

We use [Bun](https://bun.sh/) as our package manager and test runner. Bun is a fast all-in-one
JavaScript runtime that comes with a bundler, test runner, and Node.js-compatible package manager.
If you prefer, you can also use npm or [pnpm](https://pnpm.io/) instead — just swap `bun` for `npm`/`pnpm` in the commands below.

```powershell
# Always use source control ;)
git init

# And always have a README 😀
touch README.md

# Start a frontend project
# This creates a package.json
bun init
```

### editorconfig

After having installed the [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
VSCode plugin, you also need an `.editorconfig`. Pretty much every template generator creates one of these.

```ini
# See https://editorconfig.org
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
trim_trailing_whitespace = true
insert_final_newline = true
end_of_line = crlf

[*.md]
max_line_length = off
trim_trailing_whitespace = false

[*.sh]
# If you have shell scripts, make
# sure to also have a .gitattributes
# With: *.sh text eol=lf
end_of_line = lf
```

### TypeScript

While there are some devs out there that don't like TypeScript,
personally I use TypeScript even for the smallest of projects.

We covered the latest features of ECMAScript and the power
of TypeScript in our session [ModernJS](https://github.com/itenium-be/ModernJS)

These days most libraries ship their own type definitions but if one doesn't
it's probably available in [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped)

```powershell
# Add TypeScript to package.json
bun add -d typescript
```

You want to configure yourself a [`tsconfig.json`](https://www.typescriptlang.org/tsconfig/).
See this [tsconfig cheat sheet](https://www.totaltypescript.com/tsconfig-cheat-sheet)

```json
{
  "compilerOptions": {
    // Use all the latest ECMAScript goodness
    "lib": ["es2024", "dom", "dom.iterable"]
    // Fix the module.exports and export x mess
    "esModuleInterop": true,
    // Performance: don't check all node_module types
    "skipLibCheck": true,
    // Use all the latest ECMAScript goodness
    "target": "es6",
    // Import js/json files
    "allowJs": true,
    "resolveJsonModule": true,
    // Treat everything as a module
    "moduleDetection": "force",
    // Always use import/export
    "verbatimModuleSyntax": true,
    // Enables strictNullChecks, noImplicitAny etc
    "strict": true,
    // If you access it, it must be defined
    "noUncheckedIndexedAccess": true,
    // For all modern projects use this module system
    "module": "NodeNext",
    // Where to put the generated js files
    "outDir": "dist",
    // For libraries: generate .d.ts files
    "declaration": true
  }
}
```


### Testing with Bun

Bun comes with a built-in test runner that works with TypeScript out of the box — no
extra configuration needed!

```powershell
# For bun:test type definitions
bun add -d @types/bun

# Run tests
bun test
```

Your test files just import from `bun:test`:

```ts
import { describe, it, expect } from 'bun:test';
import { adder } from '../src/adder';

describe('adder', () => {
  it('works', () => {
    expect(adder(1, 5)).toBe(6);
  });
});
```

That's it. No config files, no extra dependencies, no TypeScript workarounds.
The API is compatible with Jest so switching between the two is straightforward.


### Testing with Jest

If you prefer Jest (e.g. because your project already uses it, or you
need specific Jest features like snapshot testing):

```powershell
bun add -d jest ts-jest @types/jest @jest/globals

# Setup a jest.config.ts that works with TypeScript
bunx ts-jest config:init

# Run tests
bun test
```

This [complains](https://github.com/kulshekhar/ts-jest/issues/4081) about:

```
TS1286: ESM syntax is not allowed in a CommonJS module when 'verbatimModuleSyntax' is enabled.
```

We override this for the tests with an extra `__test__` or `spec` tsconfig:

```json
{
  "extends": "../tsconfig.json",
  "compilerOptions": {
    "verbatimModuleSyntax": false
  }
}
```

And update the `jest.config.js` to use this tsconfig:

```js
/** @type {import('ts-jest').JestConfigWithTsJest} **/
module.exports = {
  testEnvironment: "node",
  transform: {
    "^.+.tsx?$": ["ts-jest",{
      tsconfig: './spec/tsconfig.json'
    }],
  },
};
```


### Visual Studio Code

Run the tests directly in Visual Studio Code with
the [Jest Plugin](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest).

And add a `.vscode/launch.json`:

```json
{
  "name": "Debug Jest Tests",
  "type": "node",
  "request": "launch",
  "runtimeArgs": [
    "--inspect-brk",
    "${workspaceRoot}/node_modules/.bin/jest",
    "--runInBand"
  ],
  "console": "integratedTerminal",
  "internalConsoleOptions": "neverOpen",
  "port": 9229
}
```

If you can't see failure details, open the Terminal `Ctrl+J`!

![Jest in Visual Studio Code!]({{ "/assets/blog-images/frontend-track-vscode-jest.png" | relative_url }} "Jest in Visual Studio Code!")


## The Sessions

Some of our frontend development sessions at itenium.

**JavaScript/TypeScript**:  
- [ModernJS](https://github.com/itenium-be/ModernJS)
- [Frontend-UnitTesting](https://github.com/itenium-be/Frontend-UnitTesting)

**React**:  
- [React](https://github.com/itenium-be/Talk-React)
- [React-New-Features](https://github.com/itenium-be/React-New-Features)
- [React-Component-Profiling](https://github.com/itenium-be/React-ComponentProfiling)


**Angular**:  
- [RXJS](https://github.com/itenium-be/RXJS)
- [Angular-ReactiveForms](https://github.com/itenium-be/angular-reactive-forms)
- [Angular-Days](https://github.com/itenium-be/Angular-Days)
