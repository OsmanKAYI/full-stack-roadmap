# reveal.js

reveal.js is an open source HTML presentation framework. It's a tool that enables anyone with a web browser to create fully-featured and beautiful presentations for free.

Presentations made with reveal.js are built on open web technologies. That means anything you can do on the web, you can do in your presentation. Change styles with CSS, include an external web page using an `<iframe>` or add your own custom behavior using our [JavaScript API](https://revealjs.com/api/).

- **VSCode Extension for Reveal JS (vscode-reveal)**
  - This extension lets you to display a reveal.js presentation directly from an opened markdown document.

## Getting Started

To get started with reveal.js, follow these steps:

```bash
# install node.js (10.0.0 or later) and npm
sudo apt install nodejs -y
sudo apt install npm -y
# clone the project from github
git clone https://github.com/hakimel/reveal.js.git
# dive into project folder and install dependencies
cd reveal.js && npm install
# start the project
npm start
```

- Open [http://localhost:8000](http://localhost:8000/) to view your presentation.

### Development Server Port

The development server defaults to port 8000. You can use the port argument to switch to a different one:

```bash
npm start -- --port=8001
```

## Documentation

For more examples and contents visit [revealjs.com](https://revealjs.com/)

- [Original HTML](./index.original.html)
- [Example HTML](./index.all.html)
- [Markdown HTML](./index.markdown.html)
- [Starter Markdown](./index.starter.md)
- [Plugin Markdown](./index.plugin.md)
- [Code Highlight Markdown](./index.code.md)
- [Math Operations Markdown](./index.math.md)

## Useful Links

- [Reveal JS Tutorial](https://revealjs.com/)
- [Plugins & Tools & Hardware](https://github.com/hakimel/reveal.js/wiki/Plugins,-Tools-and-Hardware)
  - [CopyCode](https://github.com/Martinomagnifico/reveal.js-copycode) which is a simple plugin for Reveal.js that automatically shows a 'copy' button in code blocks.
  - [reveal-css-snippet](https://github.com/soluml/reveal-css-snippet) which is a Reveal.js plugin that allows live CSS editing in code blocks.
- [Picsum Photos](https://picsum.photos/) which provides stylish placeholders being easy to use.
- [Introduction to Quasar - Sample from Divya Sonara](https://github.com/divyasonara7/introduction-to-quasar)
  - Check the live version of the [presentation](https://divyasonara7.github.io/introduction-to-quasar/)
