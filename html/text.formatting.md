# HTML Text Formatting

---

HTML contains several elements for defining text with a special meaning.

---

### Example

```html
**This text is bold** _This text is italic_ This is subscript and superscript
```

---

## HTML Formatting Elements

Formatting elements were designed to display special types of text:

- `<b>` - Bold text
- `<strong>` - Important text
- `<i>` - Italic text
- `<em>` - Emphasized text
- `<mark>` - Marked text
- `<small>` - Smaller text
- `<del>` - Deleted text
- `<ins>` - Inserted text
- `<sub>` - Subscript text
- `<sup>` - Superscript text

---

## HTML "b" and <strong> Elements

The HTML `<b>` element defines bold text, without any extra importance.

### Example

```html
<b>This text is bold</b>
```

The HTML `<strong>` element defines text with strong importance. The content inside is typically displayed in bold.

### Example

```html
<strong>This text is important!</strong>
```

---

---

## HTML "i" and "em" Elements

The HTML `<i>` element defines a part of text in an alternate voice or mood. The content inside is typically displayed in italic.

**Tip:** The `<i>` tag is often used to indicate a technical term, a phrase from another language, a thought, a ship name, etc.

### Example

```html
<i>This text is italic</i>
```

The HTML `<em>` element defines emphasized text. The content inside is typically displayed in italic.

**Tip:** A screen reader will pronounce the words in `<em>` with an emphasis, using verbal stress.

### Example

```html
<em>This text is emphasized</em>
```

---

## HTML "small" Element

The HTML `<small>` element defines smaller text:

### Example

```html
<small>This is some smaller text.</small>
```

---

## HTML "mark" Element

The HTML `<mark>` element defines text that should be marked or highlighted:

### Example

```html
<p>Do not forget to buy <mark>milk</mark> today.</p>
```

---

## HTML "del" Element

The HTML `<del>` element defines text that has been deleted from a document. Browsers will usually strike a line through deleted text:

### Example

```html
<p>My favorite color is <del>blue</del> red.</p>
```

---

## HTML "ins" Element

The HTML `<ins>` element defines a text that has been inserted into a document. Browsers will usually underline inserted text:

### Example

```html
<p>My favorite color is <del>blue</del> <ins>red</ins>.</p>
```

---

## HTML "sub" Element

The HTML `<sub>` element defines subscript text. Subscript text appears half a character below the normal line, and is sometimes rendered in a smaller font. Subscript text can be used for chemical formulas, like H2O:

### Example

```html
<p>This is <sub>subscripted</sub> text.</p>
```

---

## HTML "sup" Element

The HTML `<sup>` element defines superscript text. Superscript text appears half a character above the normal line, and is sometimes rendered in a smaller font. Superscript text can be used for footnotes, like WWW[1]:

### Example

```html
<p>This is <sup>superscripted</sup> text.</p>
```
