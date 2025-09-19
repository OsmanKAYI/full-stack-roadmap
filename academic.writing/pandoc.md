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

### 1.3. Pandoc-Crossref Installation

Pandoc-Crossref is a plugin for Pandoc that allows you to automatically generate citations and references in your Markdown file.

To install Pandoc-Crossref:

- Go to [lierdakil - Pandoc-Crossref Releases](https://github.com/lierdakil/pandoc-crossref/releases/tag/v0.3.16.0a) web page. Downoload the version which is compatible with your Pandoc version.
- Extract the downloaded `.zip` file.
- Navigate to the extracted folder and run the following command:

```bash
# Copy the `pandoc-crossref` file to your `/usr/local/bin` directory
sudo mv pandoc-crossref* /usr/local/bin/
# Make the `pandoc-crossref` file executable
sudo chmod +x /usr/local/bin/pandoc-crossref
```

### 1.4. Zotero Setup

Zotero is a free reference management tool that can store, organize, and format citations for your thesis. You will need the **Better BibTeX for Zotero** plugin for smooth integration with Pandoc.

#### 1.4.1. Installing Better BibTeX for Zotero

1. Go to [Better BibTeX for Zotero](https://github.com/retorquere/zotero-better-bibtex/releases) and download the latest release.
2. In Zotero, navigate to **Tools** > **Plugins**, then click **gear icon** and **Install Plugin From File** and select the downloaded `.xpi` file.
3. Restart Zotero to complete the installation.

#### 1.4.2. Exporting a Collection from Zotero

Once the Better BibTeX plugin is installed, you can export your Zotero collections to a `.bib` file.

1. Select the collection or library in Zotero.
2. Right-click and choose **Export Collection**.
3. Choose **Better BibLaTeX** as the export format and save the file (e.g., `ref.bib`).

**Note:** Remember to check the **keepUpdated** option to keep your references up-to-date. This will be done one-time for each work.

### 1.5. VSCode Pandoc Plugin Installation

To integrate Pandoc directly into your workflow in **VSCode**, use the **Pandoc Citer** extension. With the **Pandoc Citer** extension installed in VSCode, you can add references by searching your Zotero library directly within the editor.

This allows you to easily manage citations and format them using the CSL style when writing your thesis in Markdown.

#### 1.5.1. Installing Pandoc Citer in VSCode: Way 1

1. Open **VSCode** and go to the **Extensions** tab.
2. Search for **Pandoc Citer** and click **Install**.
3. This extension will help you easily cite references stored in your `.bib` file while writing.

#### 1.5.2. Installing Pandoc Citer in VSCode: Way 2

Directly use the following command from terminal:

```bash
code --install-extension notzaki.pandocciter
```

#### 1.5.3. Installing Pandoc Citer in VSCode: Way 3

Press `CTRL+P` and paste the following code:

```bash
ext install notzaki.pandocciter
```

### 1.6. Font Installation

```bash
# install microsoft fonts
sudo apt install ttf-mscorefonts-installer
# install nanum fonts for Korean
sudo apt install fonts-nanum
```

### 1.7. IEEE CSL Style

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
BIBLIOGRAPHY = ref.bib
CSL = ieee.csl
TEMPLATE = template.docx
INPUT = example.md
OUTPUT_DOC = result.docx
OUTPUT_PDF = result.pdf

# Target: docx output
all: $(OUTPUT_DOC) $(OUTPUT_PDF)

$(OUTPUT_DOC): $(INPUT)
  pandoc --filter=pandoc-crossref --citeproc -M link-citations=true --bibliography=$(BIBLIOGRAPHY) --csl=$(CSL) --reference-doc=$(TEMPLATE) -s $(INPUT) -o $(OUTPUT_DOC)

$(OUTPUT_PDF): $(INPUT)
  pandoc --filter=pandoc-crossref --citeproc -M link-citations=true --bibliography=$(BIBLIOGRAPHY) --csl=$(CSL) --reference-doc=$(TEMPLATE) --number-sections -s $(INPUT) -o $(OUTPUT_PDF) --pdf-engine=lualatex -V mainfont="Times New Roman" -V CJKmainfont="Nanum Gothic"
```

#### Explanation

- `--toc --toc-depth=6` is used for table of contents
- `--filter=pandoc-crossref` specifies the cross-reference filter
- `--citeproc` specifies the CSL style file to be used in the bibliography
- `-M link-citations=true` is used for citation links to work in pdf output
- `--bibliography=$(BIBLIOGRAPHY)` uses the value of `BIBLIOGRAPHY` variable as bibliography file
- `--csl=$(CSL)` uses the value of `CSL` variable as CSL style file
- `--reference-doc=$(TEMPLATE)` uses the value of `TEMPLATE` variable as reference file
- `-s` specifies the input file
- `-o` specifies the output file
- `--pdf-engine=lualatex` specifies the pdf engine for lualatex
- `-V mainfont="Times New Roman"` specifies the main font
- `-V CJKmainfont="Nanum Gothic"` specifies the CJK main font

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
- [pandoc-crossref - GitHub](https://github.com/lierdakil/pandoc-crossref)
- [pandoc-crossref - Manual](https://lierdakil.github.io/pandoc-crossref/)
