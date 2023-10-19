# HTML Attributes

---

HTML attributes provide additional information about HTML elements.

---

## HTML Attributes

- All HTML elements can have **attributes**
- Attributes provide **additional information** about elements
- Attributes are always specified in **the start tag**
- Attributes usually come in name/value pairs like: **name="value"**

---

## The href Attribute

The `<a>` tag defines a hyperlink. The `href` attribute specifies the URL of the page the link goes to:

### Example

```HTML
<a href="https://www.w3schools.com">Visit W3Schools</a>
```

## The src Attribute

The `<img>` tag is used to embed an image in an HTML page. The `src` attribute specifies the path to the image to be displayed:

### Example

```HTML
<img src="img_girl.jpg">
```

There are two ways to specify the URL in the `src` attribute:

**1. Absolute URL** - Links to an external image that is hosted on another website. Example: src="https://www.w3schools.com/images/img_girl.jpg".

**Notes:** External images might be under copyright. If you do not get permission to use it, you may be in violation of copyright laws. In addition, you cannot control external images; it can suddenly be removed or changed.

**2. Relative URL** - Links to an image that is hosted within the website. Here, the URL does not include the domain name. If the URL begins without a slash, it will be relative to the current page. Example: src="img_girl.jpg". If the URL begins with a slash, it will be relative to the domain. Example: src="/images/img_girl.jpg".

**Tip:** It is almost always best to use relative URLs. They will not break if you change domain.

---

## The width and height Attributes

The `<img>` tag should also contain the `width` and `height` attributes, which specifies the width and height of the image (in pixels):

### Example

```HTML
<img src="img_girl.jpg" width="500" height="600">
```

---

## The alt Attribute

The required `alt` attribute for the `<img>` tag specifies an alternate text for an image, if the image for some reason cannot be displayed. This can be due to slow connection, or an error in the `src` attribute, or if the user uses a screen reader.

### Example

```HTML
<img src="img_girl.jpg" alt="Girl with a jacket">
```

### Example

See what happens if we try to display an image that does not exist:

```HTML
<img src="img_typo.jpg" alt="Girl with a jacket">
```

## The style Attribute

The `style` attribute is used to add styles to an element, such as color, font, size, and more.

### Example

```HTML
<p style="color:red;">This is a red paragraph.</p>
```

## The lang Attribute

You should always include the `lang` attribute inside the `<html>` tag, to declare the language of the Web page. This is meant to assist search engines and browsers.

The following example specifies English as the language:

```HTML
<!DOCTYPE html>
<html lang="en">
<body>
...
</body>
</html>
```

Country codes can also be added to the language code in the `lang` attribute. So, the first two characters define the language of the HTML page, and the last two characters define the country.

The following example specifies English as the language and United States as the country:

```HTML
<!DOCTYPE html>
<html lang="en-US">
<body>
...
</body>
</html>
```

## The title Attribute

The `title` attribute defines some extra information about an element.

The value of the title attribute will be displayed as a tooltip when you mouse over the element:

### Example

```HTML
<p title="I'm a tooltip">This is a paragraph.</p>
```

## We Suggest: Always Use Lowercase Attributes

The HTML standard does not require lowercase attribute names.

The title attribute (and all other attributes) can be written with uppercase or lowercase like **title** or **TITLE**.

## We Suggest: Always Quote Attribute Values

The HTML standard does not require quotes around attribute values.

However, W3C **recommends** quotes in HTML, and **demands** quotes for stricter document types like XHTML.

### Good:

```HTML
<a href="https://www.w3schools.com/html/">Visit our HTML tutorial</a>
```

### Bad:

```HTML
<a href=https://www.w3schools.com/html/>Visit our HTML tutorial</a>
```

Sometimes you have to use quotes. This example will not display the title attribute correctly, because it contains a space:

### Example

```HTML
<p title=About W3Schools>
```

## Single or Double Quotes?

Double quotes around attribute values are the most common in HTML, but single quotes can also be used.

In some situations, when the attribute value itself contains double quotes, it is necessary to use single quotes:

```HTML
<p title='John "ShotGun" Nelson'>
```

Or vice versa:

```HTML
<p title="John 'ShotGun' Nelson">
```

## Chapter Summary

- All HTML elements can have **attributes**
- The `href` attribute of `<a>` specifies the URL of the page the link goes to
- The `src` attribute of `<img>` specifies the path to the image to be displayed
- The `width` and `height` attributes of `<img>` provide size information for images
- The `alt` attribute of `<img>` provides an alternate text for an image
- The `style` attribute is used to add styles to an element, such as color, font, size, and more
- The `lang` attribute of the `<html>` tag declares the language of the Web page
- The `title` attribute defines some extra information about an element
