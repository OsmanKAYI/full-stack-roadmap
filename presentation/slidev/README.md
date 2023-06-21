# Slidev

Slidev (slide + dev) is a web-based slides maker and presenter. It's designed for developers to focus on writing content in Markdown while also having the power of HTML and Vue components to deliver pixel-perfect layouts and designs with embedded interactive demos in your presentations.

It uses a feature-rich markdown file to generate beautiful slides with an instant reloading experience, along with many built-in integrations such as live coding, PDF exporting, presentation recording, and so on. Since it's powered by the web, you can do anything with Slidev - the possibilities are endless.

## Getting Started

To get started with Slidev, follow these steps:

```BASH
sudo apt install nodejs -y
sudo apt install npm -y
npm init slidev -y
```

After that

- Give a name to your project (default is `slides`).
- Say `y` to `Install and start it now?`
- Choose `npm` and press <kbd>Enter</kbd>.

  - Open [http://localhost:3030](http://localhost:3030/) to view your presentation.

- To work on presentation for second time

```BASH
npm run dev
# visit http://localhost:3030
# or http://localhost:3030/presenter
```

- To export your presentation

```BASH
npm i -D playwright-chromium
npm run export
# exported to ./slides-export.pdf
```

## Documentation

For more examples and contents visit [sli.dev](https://sli.dev/)

- [Slidev Guide](https://sli.dev/guide/)
- [Presentaion Template](./slides.md)
