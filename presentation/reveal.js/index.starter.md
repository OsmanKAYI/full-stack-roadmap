<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

## Slide 1 - Text

This is the text inside the slide.

---

## Slide 2 - Link

A paragraph with some text and a [link](https://hakim.se).

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
