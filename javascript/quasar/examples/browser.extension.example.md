# Creating Browser Extensions with Quasar and Vue 3

**TL;DR:** This guide outlines the steps to build a Chrome extension using Quasar and Vue 3, focusing on modifying font sizes on any webpage. Key concepts like Quasar BEX mode, `manifest.json` configuration, and testing are covered. Additionally, the extension’s functionality is enhanced by adding custom CSS.

## Introduction

Browser extensions add functionality to browsers. Some extensions provide extra data on web pages, like:

- [Wappalyzer](https://chrome.google.com/webstore/detail/wappalyzer-technology-pro/gppongmhjkpfnbhagpmjfkannfbllamg?hl=en) - Displays the technologies used on websites.
- [Similar Web](https://chrome.google.com/webstore/detail/similarweb-traffic-rank-w/hoklmmgfnpapgjgcpechhaamimifchmp?hl=en) - Provides traffic and ranking information for web pages.

Others change the home screen or modify webpage content, like [Momentum](https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca?hl=en).

## Project Overview

This tutorial demonstrates creating a Chrome extension using Vue 3 and Quasar. The extension adjusts the font size on visited pages, useful for accessibility.

## How Browser Extensions Work

- Start with a `manifest.json` file, which contains metadata for the extension.
- Define the scripts executed when the extension is installed and specify their execution context via `manifest.json`.

## Building an Extension with Quasar

Quasar BEX mode is supported on Chrome, Firefox, and other Chromium-based browsers. Follow these steps to create the project:

### 1. Create a Quasar Project

Install Quasar CLI and create a project:

```bash
npm i -g @quasar/cli
npm init quasar
```

Select "App with Quasar CLI" and configure the project. Choose Quasar V2 with Vue 3, and either TypeScript or JavaScript. Use Vite as the build tool and proceed with default options.

### 2. Quasar Extensions Overview

Quasar supports extensions that can run in:

- [New Tab](https://quasar.dev/quasar-cli-vite/developing-browser-extensions/types-of-bex#new-tab)
- [Dev Tools, Options & Popup](https://quasar.dev/quasar-cli-vite/developing-browser-extensions/types-of-bex#dev-tools-options-and-popup)
- [Web Page](https://quasar.dev/quasar-cli-vite/developing-browser-extensions/types-of-bex#web-page) - Injects Quasar apps into web pages.

### 3. Add BEX Mode

Add BEX mode to the Quasar project:

```bash
quasar mode add bex
```

For faster development:

```bash
quasar dev -m bex
```

Choose Manifest Version 3 for compatibility with Chrome. Learn more about the structure of the `src-bex` directory [here](https://quasar.dev/quasar-cli-vite/developing-browser-extensions/preparation#2-understand-the-anatomy-of-src-bex).

### 4. Configuring BEX

The `/src-bex/manifest.json` file is crucial for configuring the extension. More details on its structure can be found [here](https://developer.chrome.com/extensions/manifest).

Key concepts for the project:

- **Background Script:** Runs in the extension context and listens to browser events. Only one instance per extension.
- **Content Script:** Runs in the webpage context. A new instance is created per tab.

Quasar's [official BEX documentation](https://quasar.dev/quasar-cli-vite/developing-browser-extensions/configuring-bex) provides more details.

## Testing the Extension

Open Chrome and go to `chrome://extensions`. Enable Developer mode and load the unpacked extension by selecting the directory containing the `manifest.json`. In Chrome, this would be `/dist/bex`.

Reload the extension after making updates.

## Adding Functionality

To modify font sizes, add custom CSS in `src-bex/assets/content.css`:

```css
/* src-bex/assets/content.css */
p,
span,
code {
  font-size: 21px !important;
  line-height: 175% !important;
}
```

Refresh the extension and visit any webpage to see the changes.

**NOTE:** If you have any problem with the type of `respond()` function in `src-bex/background.ts`, replace

1. problematic `respond()` with `respond(data.message);`
2. `log: [{ message: string; data?: any[] }, never];` with `log: [{ message: string; data?: any[] }, string];`

## Conclusion

This guide introduces browser extensions and demonstrates how to build one using Quasar and Vue 3. For more advanced features, like injecting JavaScript or building ad-blockers, explore the [Chrome extension documentation](https://developer.chrome.com/docs/extensions/mv3/getstarted/) and [Quasar's BEX documentation](https://quasar.dev/quasar-cli-webpack/developing-browser-extensions/introduction).

**Ref:** [Allan M. Jeremy - thisdot](https://www.thisdot.co/blog/how-to-create-browser-extensions-using-quasar-and-vue-3)
