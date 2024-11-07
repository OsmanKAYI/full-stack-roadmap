# Writing a Thesis with Markdown and LaTeX

## TL;DR

1. Install the necessary packages and tools to write a thesis using **Markdown**.
2. Convert your Markdown file to LaTeX or PDF format using **Pandoc**.
3. Install additional LaTeX packages as required.

---

## 1. Required Software and Packages

To generate a PDF or Word output in LaTeX format for your thesis, you should install the following software:

### 1.1. LaTeX Distribution Installation

Install LaTeX and related packages on Ubuntu:

```bash
sudo apt update
sudo apt install texlive-full
```

This command installs the full version of LaTeX, including all basic packages and PDF generation engines (such as pdflatex, xelatex, lualatex), which are necessary for your thesis.

### 1.2. Pandoc Installation

We will use **Pandoc** to convert the Markdown file to PDF or Word format. Pandoc supports LaTeX, so you can compile your Markdown file in LaTeX format.

To install Pandoc:

```bash
sudo apt install pandoc
```

## 2. Writing Your Markdown File

Markdown is a very simple markup language. You can write the content of your thesis in Markdown format. Here is an example of the basic structure of a Markdown file:

```markdown
# Thesis Title

## Introduction

The introduction to your thesis can be written here. You can create headers, paragraphs, and lists using Markdown.

### Objective

The objective of your thesis can be defined here.

## Methodology

Details for the methodology section can go here.

## Results

Results and findings can be presented here.
```

## 3. Converting with Pandoc

### 3.1. Converting Markdown to PDF

To convert a Markdown file to **PDF**, you can use the following command. Pandoc uses LaTeX engines to generate the PDF output.

```bash
pandoc example.md -o example.pdf --pdf-engine=pdflatex
```

If you prefer to use **xelatex** or **lualatex** as the engine:

```bash
pandoc example.md -o example.pdf --pdf-engine=xelatex
```

### 3.2. Converting Markdown to Word

To convert a Markdown file to **Word**, use this command:

```bash
pandoc example.md -o example.docx --reference-doc=template.docx
```

You must prepare a `template.docx` file that matches your university's required format (margins, heading styles, etc.).

### 3.3. Managing References with BibTeX

You can manage references in your Markdown file using **BibTeX**. You can include a reference file (`.bib` extension) as follows:

```markdown
# Thesis Title

## Introduction

The introduction to your thesis is written here [@source].

## References

@article{source,
author = {Author Name},
title = {Article Title},
journal = {Journal Name},
year = {2024},
}
```

You can store your bibliography information in a `references.bib` file and Pandoc will process it.

## 4. Results and Next Steps

- **Markdown** provides a simple and quick way to write content. However, to meet academic writing requirements, it’s important to use **Pandoc’s** powerful conversion tools.
- For reference management, you can use **Biber** or **BibTeX**.
- Pandoc allows you to switch between **LaTeX**, **PDF**, and **Word** formats seamlessly.

## 5. Additional LaTeX Packages (Optional)

If you want to further customize and format your thesis, the following LaTeX packages may be helpful:

- **texlive-latex-recommended**: Basic and recommended LaTeX packages.

  ```bash
  sudo apt install texlive-latex-recommended
  ```

- **texlive-latex-extra**: Additional features.

  ```bash
  sudo apt install texlive-latex-extra
  ```

- **texlive-fonts-recommended**: Advanced font support.

  ```bash
  sudo apt install texlive-fonts-recommended
  ```
