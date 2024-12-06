# Academic Writing with Pandoc and LaTeX

This guide provides comprehensive information about using Pandoc and LaTeX for academic writing, including research papers, theses, and academic documentation.

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Basic Usage](#basic-usage)
4. [Document Structure](#document-structure)
5. [Academic Writing Features](#academic-writing-features)
6. [Templates](#templates)
7. [Best Practices](#best-practices)
8. [Resources](#resources)

## Introduction

Pandoc and LaTeX are powerful tools for academic writing:

- **Pandoc**: A universal document converter that can convert between multiple formats
- **LaTeX**: A high-quality typesetting system designed for technical and scientific documentation

### Why Use Pandoc with LaTeX?

1. **Format Flexibility**: Write in Markdown and convert to multiple formats
2. **Bibliography Management**: Easily handle citations and references
3. **Professional Output**: Generate high-quality PDF documents
4. **Version Control**: Plain text format works well with Git
5. **Cross-referencing**: Easy handling of figures, tables, and sections

## Installation

### LaTeX Installation

```bash
# Ubuntu/Debian
sudo apt-get install texlive-full
sudo apt-get install texlive-latex-extra

# macOS
brew install --cask mactex

# Windows
# Download and install MiKTeX from https://miktex.org/
```

### Pandoc Installation

```bash
# Ubuntu/Debian
sudo apt-get install pandoc

# macOS
brew install pandoc

# Windows
# Download installer from https://pandoc.org/installing.html
```

## Basic Usage

### Converting Markdown to PDF

```bash
pandoc input.md -o output.pdf
```

### Using Citations

```bash
pandoc input.md --bibliography=refs.bib --csl=style.csl -o output.pdf
```

## Document Structure

### Basic Template

```markdown
---
title: 'Your Paper Title'
author: 'Your Name'
date: '2024-01-20'
abstract: 'Your abstract here'
bibliography: references.bib
csl: ieee.csl
---

# Introduction

Your content here...

# Methods

## Subsection

More content...

# Results

# Discussion

# References
```

## Academic Writing Features

### Citations and References

In-text citations:

```markdown
According to @smith2020, this finding is significant.
This has been proven in multiple studies [@jones2019; @brown2021].
```

### Figures and Tables

```markdown
![Caption for your figure](./images/figure1.png){#fig:label}

| Column 1 | Column 2 |
| -------- | -------- |
| Data 1   | Data 2   |

: Caption for your table {#tbl:label}
```

### Cross-references

```markdown
As shown in Figure @fig:label and Table @tbl:label...
```

## Templates

### Common Templates

1. **Article Template**
2. **Thesis Template**
3. **Conference Paper Template**

Example template usage:

```bash
pandoc input.md --template=template.tex -o output.pdf
```

## Best Practices

1. **File Organization**

   ```text
   project/
   ├── manuscript.md
   ├── references.bib
   ├── figures/
   ├── tables/
   └── templates/
   ```

2. **Version Control**

   - Use Git for tracking changes
   - Commit frequently with meaningful messages
   - Keep backup copies

3. **Writing Style**
   - Use consistent formatting
   - Follow style guide requirements
   - Maintain clear section structure

## Resources

### LaTeX Resources

- [LaTeX Project Website](https://www.latex-project.org/)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [LaTeX Cheatsheet](https://quickref.me/latex)

### Pandoc Resources

- [Pandoc User Guide](https://pandoc.org/MANUAL.html)
- [Pandoc Citations](https://pandoc.org/MANUAL.html#citations)
- [Pandoc Demos](https://pandoc.org/demos.html)
- [Pandoc Templates](https://github.com/jgm/pandoc-templates)
- [Pandoc Commands Cheatsheet](https://quickref.me/pandoc)

### Citation Management

- [Zotero](https://www.zotero.org/)
- [Mendeley](https://www.mendeley.com/)
- [BibTeX Format](http://www.bibtex.org/)

### Style Guides

- [APA Style](https://apastyle.apa.org/)
- [Chicago Manual of Style](https://www.chicagomanualofstyle.org/)
- [IEEE Editorial Style](https://ieeeauthorcenter.ieee.org/)

## Documentation

- [Pandoc](pandoc.md)
