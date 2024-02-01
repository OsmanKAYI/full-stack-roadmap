<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" href="dist/reset.css">
<link rel="stylesheet" href="dist/reveal.css">
<!-- Theme used for syntax highlighted code -->
<link rel="stylesheet" href="dist/theme/league.css">

<!-- Plugin used for highlighting -->
<link rel="stylesheet" href="plugin/highlight/monokai.css">
<!-- Plugin used for markdown presentations -->
<link rel="stylesheet" href="plugin/markdown/markdown.js">
<!-- Plugin used for highlighting -->
<link rel="stylesheet" href="plugin/highlight/highlight.js">
<!-- Plugin used to take speaker notes -->
<link rel="stylesheet" href="plugin/notes/notes.js">

## Slide 1 - Speaker Note

This is the text inside the slide.

  <aside class="notes">
    Shhh, these are your private notes 📝
  </aside>

---

## Slide 2 - Link and Background Image

A paragraph with some text and a [link](https://hakim.se).

<section data-background-transition="convex"
        data-background-image="https://picsum.photos/id/870/2000/1500?grayscale&blur=2">
</section>

---

## Slide 3 - Fade

<section 
  data-background-color="lightblue">
  <span class="fragment fade-in">
    <span class="fragment highlight-red">
      <span class="fragment fade-out">
        Fade in > Turn red > Fade out
      </span>
    </span>
  </span>
</section>

---

## Slide 4 - Fragment

<p class="fragment" data-fragment-index="3">Appears last</p>
<p class="fragment" data-fragment-index="1">Appears first</p>
<p class="fragment" data-fragment-index="2">Appears second</p>

---

## Slide 5 - Auto-Animate

<section 
  data-auto-animate>
  <h3>Implicit</h3>
</section>

<section 
  data-auto-animate>
    <h3>Implicit</h3>
    <h3>Animation</h3>
</section>

---

## Slide 6 - Video

<video data-autoplay src="https://static.slid.es/site/homepage/v1/homepage-video-editor.mp4"></video>

---

## Slide 7 - Iframe (Interactive)

<section 
  data-background-iframe="http://osmankayi.com" 
  data-background-interactive>
</section>

---

## Slide 8 - Code Highlight

```php
echo "Hello World!";
```

---

## Slide 9 - Math Operations

<section>
  <h4>The Lorenz Equations</h4>
  \[\begin{aligned}
  \dot{x} &amp; = \sigma(y-x) \\
  \dot{y} &amp; = \rho x - y - xz \\
  \dot{z} &amp; = -\beta z + xy
  \end{aligned} \]
</section>
