# How To Decrease the Size of a PDF File

You can decrease the size of an pdf file with using `gs` command. It has lots of options and some of them are described in the example below.

`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf`

## Example

Compression's results of 17.7 MB pdf file are as follows

```BASH
# -dPDFSETTINGS=/default: selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.default.pdf input.pdf
# 17.9 MB

# -dPDFSETTINGS=/prepress: output similar to Acrobat Distiller "Prepress Optimized" setting (300 dpi)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.prepress.pdf input.pdf
# 17.9 MB

# -dPDFSETTINGS=/printer: selects output similar to the Acrobat Distiller "Print Optimized" setting (300 dpi)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.printer.pdf input.pdf
# 17.9 MB

# -dPDFSETTINGS=/ebook: for better quality, but slightly larger pdfs. (150 dpi)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.ebook.pdf input.pdf
# 6.3 MB

# -dPDFSETTINGS=/screen: lower quality, smaller size. (72 dpi)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.screen.pdf input.pdf
#  2.4 MB (bad quality, not usable)
```
