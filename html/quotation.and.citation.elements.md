# HTML Quotation and Citation Elements

---

In this chapter we will go through the `<blockquote>`,`<q>`, `<abbr>`, `<address>`, `<cite>`, and `<bdo>` HTML elements.

---

### Example

Here is a quote from WWF's website:

```HTML
> For nearly 60 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by more than one million members in the United States and close to five million globally.
```

---

## HTML "blockquote" for Quotations

The HTML `<blockquote>` element defines a section that is quoted from another source.

Browsers usually indent `<blockquote>` elements.

### Example

```HTML
<p>Here is a quote from WWF's website:</p>
<blockquote cite="http://www.worldwildlife.org/who/index.html">
For 50 years, WWF has been protecting the future of nature.
The world's leading conservation organization,
WWF works in 100 countries and is supported by
1.2 million members in the United States and
close to 5 million globally.
</blockquote>
```

---

## HTML "q" for Short Quotations

The HTML `<q>` tag defines a short quotation.

Browsers normally insert quotation marks around the quotation.

### Example

```HTML
<p>WWF's goal is to: <q>Build a future where people live in harmony with nature.</q></p>
```

---

---

## HTML "abbr" for Abbreviations

The HTML `<abbr>` tag defines an abbreviation or an acronym, like "HTML", "CSS", "Mr.", "Dr.", "ASAP", "ATM".

Marking abbreviations can give useful information to browsers, translation systems and search-engines.

**Tip:** Use the global title attribute to show the description for the abbreviation/acronym when you mouse over the element.

### Example

```HTML
<p>The <abbr title="World Health Organization">WHO</abbr> was founded in 1948.</p>
```

---

## HTML "address" for Contact Information

The HTML `<address>` tag defines the contact information for the author/owner of a document or an article.

The contact information can be an email address, URL, physical address, phone number, social media handle, etc.

The text in the `<address>` element usually renders in _italic,_ and browsers will always add a line break before and after the `<address>` element.

### Example

```HTML
<address>
Written by John Doe.<br>
Visit us at:<br>
Example.com<br>
Box 564, Disneyland<br>
USA
</address>
```

---

## HTML "cite" for Work Title

The HTML `<cite>` tag defines the title of a creative work (e.g. a book, a poem, a song, a movie, a painting, a sculpture, etc.).

**Note:** A person's name is not the title of a work.

The text in the `<cite>` element usually renders in _italic_.

### Example

```HTML
<p><cite>The Scream</cite> by Edvard Munch. Painted in 1893.</p>
```

---

## HTML "bdo" for Bi-Directional Override

BDO stands for Bi-Directional Override.

The HTML `<bdo>` tag is used to override the current text direction:

### Example

```HTML
<bdo dir="rtl">This text will be written from right to left</bdo>
```
