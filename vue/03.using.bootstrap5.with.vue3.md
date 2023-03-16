# Using Bootstrap 5 with Vue 3

**Note:** The codes given belove should be run in your project's folder.

- Install bootstrap as you would any other JS module in the Vue project using npm install or by adding it to the `package.json`...

```
npm install --save bootstrap<br>
npm install --save @popperjs/core

```

- Next, add the Bootstrap CSS and JS components to the Vue project entrypoint (ie: `src/main.js`)...

```
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
```

**REF:** https://stackoverflow.com/questions/65547199/using-bootstrap-5-with-vue-3
