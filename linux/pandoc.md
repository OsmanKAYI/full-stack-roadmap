# Writing a Thesis with Markdown and LaTeX

## TL;DR

1. Install necessary software and packages to write a thesis in **Markdown**.
2. Convert Markdown to LaTeX or PDF format using **Pandoc**.
3. Use Zotero for reference management.
4. Set up VSCode with Pandoc plugins and configure citations.
5. Create a `Makefile` to automate the conversion process.

---

## 1. Required Software and Packages

To generate a PDF or Word output in LaTeX format for your thesis, you should install the following software:

### 1.1. LaTeX Distribution Installation

Install LaTeX and related packages on Ubuntu:

```bash
sudo apt update
sudo apt install texlive-full
```

This installs the full version of LaTeX, which includes all the basic packages and PDF generation engines (e.g., pdflatex, xelatex, lualatex), necessary for your thesis.

### 1.2. Pandoc Installation

We will use **Pandoc** to convert the Markdown file into PDF or Word format. Pandoc supports LaTeX, so it can compile your Markdown file to LaTeX format.

To install Pandoc:

```bash
sudo apt install pandoc
```

### 1.3. Zotero Setup

Zotero is a free reference management tool that can store, organize, and format citations for your thesis. You will need the **Better BibTeX for Zotero** plugin for smooth integration with Pandoc.

#### 1.3.1. Installing Better BibTeX for Zotero

1. Go to [Better BibTeX for Zotero](https://github.com/retorquere/zotero-better-bibtex/releases) and download the latest release.
2. In Zotero, navigate to **Tools** > **Plugins**, then click **gear icon** and **Install Plugin From File** and select the downloaded `.xpi` file.
3. Restart Zotero to complete the installation.

#### 1.3.2. Exporting a Collection from Zotero

Once the Better BibTeX plugin is installed, you can export your Zotero collections to a `.bib` file.

1. Select the collection or library in Zotero.
2. Right-click and choose **Export Collection**.
3. Choose **Better BibLaTeX** as the export format and save the file (e.g., `ref.bib`).

**Note:** Remember to check the **keepUpdated** option to keep your references up-to-date. This will be done one-time for each work.

### 1.4. VSCode Pandoc Plugin Installation

To integrate Pandoc directly into your workflow in **VSCode**, use the **Pandoc Citer** extension. With the **Pandoc Citer** extension installed in VSCode, you can add references by searching your Zotero library directly within the editor.

This allows you to easily manage citations and format them using the CSL style when writing your thesis in Markdown.

#### 1.4.1. Installing Pandoc Citer in VSCode: Way 1

1. Open **VSCode** and go to the **Extensions** tab.
2. Search for **Pandoc Citer** and click **Install**.
3. This extension will help you easily cite references stored in your `.bib` file while writing.

#### 1.4.1. Installing Pandoc Citer in VSCode: Way 2

Directly use the following command from terminal:

```bash
code --install-extension notzaki.pandocciter
```

#### 1.4.1. Installing Pandoc Citer in VSCode: Way 3

Press `CTRL+P` and paste the following code:

```bash
ext install notzaki.pandocciter
```

### 1.5. IEEE CSL Style

For IEEE style citations, you'll need the **ieee.csl** file, which defines how references are formatted in your thesis.

You can find the CSL file for IEEE citations and much more here: [IEEE CSL Style](https://github.com/citation-style-language/styles).

## 2. Converting with Pandoc

### 2.1. Converting Markdown to PDF

To convert a Markdown file to **PDF**, use the following command. Pandoc will use LaTeX engines to generate the PDF output:

```bash
pandoc -s example.md -o example.pdf
```

### 2.2. Converting Markdown to Word

To convert a Markdown file to **Word**, use this command:

```bash
pandoc -s example.md -o example.docx --reference-doc=template.docx
```

Make sure you prepare a `template.docx` file that matches your university's required formatting (e.g., margins, heading styles).

### 2.3. Managing References with BibTeX

To manage references in your Markdown file, use **BibTeX**. Include a reference in the following format:

```bibtex
@article{source,
  author = {Author Name},
  title = {Article Title},
  journal = {Journal Name},
  year = {2024},
}
```

You can store your bibliography in a `ref.bib` file, and Pandoc will process it automatically.

## 3. Example `Makefile`

A `Makefile` is an efficient way to automate the conversion of Markdown to Word, PDF, or other formats.

### 3.1. Example Makefile

```makefile
# File variables
INPUT = example.md
OUTPUT = result.docx
TEMPLATE = template.docx
BIBLIOGRAPHY = ref.bib
CSL = ieee.csl

# Target: docx output
all:
pandoc -s $(INPUT) -o $(OUTPUT) -M link-citations=true --reference-doc=$(TEMPLATE) --bibliography=$(BIBLIOGRAPHY) --csl=$(CSL) --citeproc
```

#### Explanation

- `INPUT` specifies the Markdown file to be converted.
- `OUTPUT` specifies the output file name.
- `TEMPLATE` is the Word document template for reference formatting.
- `BIBLIOGRAPHY` points to the `.bib` file containing the citations.
- `CSL` is the **IEEE CSL file** for citation formatting.
- `--citeproc` enables citation processing using the CSL file.

### 3.2. Running the Makefile

To execute the Makefile and convert your document, use:

```bash
make
```

This command will use the settings from the Makefile to generate the output file (e.g., `result.docx`).

## 4. Example Markdown File

In your Markdown file, you can manage citations and references like this:

```yaml
---
bibliography: ref.bib
---
# Chapter 1: Introduction

This is the introduction to the thesis. You can cite sources like this [@source].
```

Here, `@source` corresponds to an entry in your `ref.bib` file. The `csl` field specifies the citation style.

## 5. Generating Output

To generate the output in **Word** or **PDF** format, run the following command:

### 5.1. Word Output

```bash
pandoc -s example.md -o result.docx -M link-citations=true --reference-doc=template.docx --bibliography=ref.bib --csl=ieee.csl --citeproc
```

### 5.2. PDF Output

```bash
pandoc -s example.md -o result.pdf --pdf-engine=xelatex --bibliography=ref.bib --csl=ieee.csl --citeproc
```

This will process your Markdown file, include citations, and format the output according to the IEEE style.

**Refs:**

- [The Pandoc Manual](https://pandoc.org/MANUAL.html)
- [Zotero](https://www.zotero.org/styles)
