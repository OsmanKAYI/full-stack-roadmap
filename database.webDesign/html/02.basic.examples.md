# HTML Basic Examples

## HTML Documents

All HTML documents must start with a document type declaration: `<!DOCTYPE html>`.

The HTML document itself begins with `<html>` and ends with `</html>`.

The visible part of the HTML document is between `<body>` and `</body>`.

## The <!DOCTYPE> Declaration

The `<!DOCTYPE>` declaration represents the document type, and helps browsers to display web pages correctly.

It must only appear once, at the top of the page (before any HTML tags).

The `<!DOCTYPE>` declaration is not case sensitive.

The `<!DOCTYPE>` declaration for HTML5 is:

<!DOCTYPE html>

## HTML Headings

HTML headings are defined with the `<h1>` to `<h6>` tags.

`<h1>` defines the most important heading. `<h6>` defines the least important heading:

### Example

```HTML
<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
```

## HTML Paragraphs

HTML paragraphs are defined with the `<p>` tag:

### Example

```HTML
<p>This is a paragraph.</p>
<p>This is another paragraph.</p>
```

## HTML Links

HTML links are defined with the `<a>` tag:

### Example

```HTML
<a href="https://www.w3schools.com">This is a link</a>
```

- The link's destination is specified in the `href` attribute.

- Attributes are used to provide additional information about HTML elements.

## HTML Images

HTML images are defined with the `<img>` tag.

The source file (`src`), alternative text (`alt`), `width`, and `height` are provided as attributes:

### Example

```HTML
<img src="w3schools.jpg" alt="W3Schools.com" width="104" height="142">
```
