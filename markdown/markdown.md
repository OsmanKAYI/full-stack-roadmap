# Markdown

Markdown is a lightweight markup language for creating formatted text using a plain-text editor.
Markdown is widely used in blogging, instant messaging, online forums, collaborative software, documentation pages, and readme files.

## Format

An MD file is a text file created using one of several possible dialects of the Markdown language. It is saved in plain text format but includes inline symbols that define how to format the text (e.g. bold, indentations, headers, table formatting).

## Purpose

What Is It? Markdown is a plain text formatting syntax aimed at making writing for the internet easier. The philosophy behind Markdown is that plain text documents should be readable without tags mussing everything up, but there should still be ways to add text modifiers like lists, bold, italics, etc.

## Variants

Sites like GitHub,Bitbucket, Reddit, Diaspora, Stack Exchange, OpenStreetMap and SourceForge use variants of Markdown to facilitate discussion between users. Markdown is also supported in a wide variety of apps and services, like Microsoft Teams chat and Discord messages.
Depending on implementation, basic inline HTML tags may be supported. Italic text may be implemented by _underscores_ and/or _single-asterisks_.

## Markdown Extra

Markdown Extra is a lightweight markup language based on Markdown implemented in PHP (originally), Python and Ruby. It adds features not available with plain Markdown syntax. Markdown Extra is supported in some content management systems such as, for example, Drupal and TYPO3.
Markdown Extra adds the following features to Markdown:

    Markdown markup inside HTML blocks
    Elements with id/class attribute
    "Fenced code blocks" that span multiple lines of code
    Tables
    Definition lists
    Footnotes
    Abbreviations

## LiaScript

LiaScript is a Markdown dialect that was designed to create interactive educational content. It is implemented in Elm and Typescript and adds additional syntax elements to define features like:

    Animations
    Automatic speech output
    Mathematical formulas (using KaTeX)
    ASCII art diagrams
    Various types of quizzes and surveys
    JavaScript is natively supported and can be attached to various elements, this way code fragments can be made executable and editable

**Ref:** https://en.wikipedia.org/wiki/Markdown

## Use Emoji in Markdown

    https://getemoji.com/
    https://gist.github.com/rxaviers/7360908

## Embedding a YouTube Video into Markdown

[![videoName](http://img.youtube.com/vi/VIDEONUNKODUBURAYA/0.jpg)](http://www.youtube.com/watch?v=VIDEONUNKODUBURAYA)

## Making List Having Checkbox

    - [ ] Make sure PHP CS Fixer installed for the development environment only
    We needn't have CS Fixer on any other environment.

    - [ ] Make sure to exclude auto-generated files
    Strongly recommended to exclude auto-generated files like `Migrations` for example. That kind of file may be risky to overwrite.

    - [ ] Set correct CS rules based on project needs
    You can find all CS rules on [this](https://mlocati.github.io/php-cs-fixer-configurator) repository.

## Create a Single Line Table at the Top of the .md File

```md
---
title: Configure PHP CS Fixer
category: Back-End
date: "2020-03-23"
tags: ["php", "symfony", "configure"]
description: Sometimes, we mess up the basic rules of code style. So we need a friend to cover our back! With PHP we are using PHP CS Fixer by to configure it we follow the steps below.
---
```

---

title: Configure PHP CS Fixer
category: Back-End
date: "2020-03-23"
tags: ['php', 'symfony', 'configure']
description: Sometimes, we mess up the basic rules of code style. So we need a friend to cover our back! With PHP we are using PHP CS Fixer by to configure it we follow the steps below.

---

**Ref:** https://github.com/nuriakman/PHP-Egitimi/blob/master/konular/Markdown.kodlama.md
