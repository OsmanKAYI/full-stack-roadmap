# Pico - Classless CSS

[Pico](https://picocss.com/) is a lightweight, classless CSS framework that aims to be a lightweight and easy to use CSS framework.

## Usage

Works without package manager or dependencies 🙂!

There are 4 ways to get started with Pico CSS:

### Install manually

[Download Pico](https://github.com/picocss/pico/archive/refs/tags/v1.5.11.zip) and link `/css/pico.min.css` in the `<head>` of your website.

```js
<link rel="stylesheet" href="css/pico.min.css">
```

### Install from CDN

Alternatively, you can use [jsDelivr CDN](https://www.jsdelivr.com/package/npm/@picocss/pico) to link pico.css

```js
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
```

### Install with NPM

```BASH
npm install @picocss/pico
```

### Install with Composer

```BASH
composer require picocss/pico
```

**Starter HTML template:**

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/pico.min.css" />
    <title>Hello, world!</title>
  </head>
  <body>
    <main class="container">
      <h1>Hello, world!</h1>
    </main>
  </body>
</html>
```

**NOTE:** To use Pico with Vue3,

- Run the following command inside of your project folder.

```BASH
npm i @picocss/pico
```

- Then, add the following script tag to your `main.js` file.

```js
// PicoCSS
import "./../node_modules/@picocss/pico/css/pico.min.css";
```

- At the end, comment out or delete vuetify (or any kind of vue component framework) related rows in your `main.js` file.
