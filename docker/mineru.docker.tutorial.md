# Installing and Using MinerU with Docker

## Introduction

MinerU is a powerful tool that converts various document formats (PDF, PPT, PPTX, DOC, DOCX, PNG, JPG) into machine-readable formats such as Markdown and JSON. This tutorial will guide you through installing MinerU using Docker and demonstrate how to use it effectively.

## Prerequisites

- Docker installed on your system
- Basic knowledge of terminal/command line

## Installation

MinerU officially requires a GPU with at least 16GB of VRAM for optimal performance. However, this tutorial includes instructions for setting up a CPU-only version that works on systems without dedicated GPU support.

### Step 1: Clone the MinerU Repository

```bash
git clone https://github.com/opendatalab/MinerU.git
cd MinerU
```

### Step 2: Create a CPU-Compatible Dockerfile

Create a file named `Dockerfile.cpu` in the `docker/global` directory with the following content:

```dockerfile
# Use the official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to non-interactive to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
        software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
        python3.10 \
        python3.10-venv \
        python3.10-distutils \
        python3-pip \
        wget \
        git \
        libgl1 \
        libreoffice \
        fonts-noto-cjk \
        fonts-wqy-zenhei \
        fonts-wqy-microhei \
        ttf-mscorefonts-installer \
        fontconfig \
        libglib2.0-0 \
        libxrender1 \
        libsm6 \
        libxext6 \
        poppler-utils \
        && rm -rf /var/lib/apt/lists/*

# Set Python 3.10 as the default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Create a virtual environment for MinerU
RUN python3 -m venv /opt/mineru_venv

# Copy the configuration file template and install magic-pdf latest
RUN /bin/bash -c "wget https://github.com/opendatalab/MinerU/raw/master/magic-pdf.template.json && \
    cp magic-pdf.template.json /root/magic-pdf.json && \
    source /opt/mineru_venv/bin/activate && \
    pip3 install --upgrade pip && \
    pip3 install -U magic-pdf[full]"

# Download models and update the configuration file
RUN /bin/bash -c "pip3 install huggingface_hub && \
    wget https://github.com/opendatalab/MinerU/raw/master/scripts/download_models_hf.py -O download_models.py && \
    python3 download_models.py"

# Set the entry point to activate the virtual environment and run the command line tool
ENTRYPOINT ["/bin/bash", "-c", "source /opt/mineru_venv/bin/activate && exec \"$@\"", "--"]
```

### Step 3: Build the Docker Image

```bash
cd docker/global
docker build -t mineru-cpu:latest -f Dockerfile.cpu .
```

This process may take some time as it downloads and installs all necessary dependencies and models.

## Using MinerU

Once the Docker image is built, you can use MinerU to convert various document formats to Markdown and JSON.

### Basic Usage

To convert a document, use the following command structure:

```bash
docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory
```

This command:

- Mounts your current directory to `/data` inside the container
- Processes `your_document.pdf` from your current directory
- Saves the output to `output_directory` in your current directory

### Conversion Methods

MinerU offers three different methods for document conversion:

1. **OCR Mode**: Uses optical character recognition to extract information from documents

   ```bash
   docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -m ocr
   ```

2. **Text Mode**: Better for text-based PDFs, more efficient than OCR

   ```bash
   docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -m txt
   ```

3. **Auto Mode**: Automatically selects the best method (default)

   ```bash
   docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -m auto
   ```

### Language Support

To improve OCR accuracy for documents in specific languages, use the language parameter:

```bash
docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -l en
```

Replace `en` with the appropriate language code (e.g., `fr` for French, `de` for German, etc.).

### Processing Specific Pages

To convert only specific pages of a document:

```bash
docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -s 0 -e 5
```

This processes pages 0 through 5 (inclusive).

### Debug Mode

For detailed debugging information during conversion:

```bash
docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p /data/your_document.pdf -o /data/output_directory -d true
```

## Output Files

After processing, MinerU generates several output files:

- **Markdown (.md)**: A human-readable version of the document with preserved formatting
- **JSON (.json)**: A structured representation of the document content
- **Images folder**: Contains extracted images from the document

## Advanced Usage

### Processing Multiple Files

To process all PDF files in a directory:

```bash
for file in *.pdf; do
  docker run --rm -v $(pwd):/data mineru-cpu:latest magic-pdf -p "/data/$file" -o "/data/output_${file%.pdf}"
done
```

### Integration with Other Tools

The generated Markdown and JSON files can be easily integrated with other tools and workflows:

- Use the Markdown files with static site generators
- Process the JSON files with data analysis tools
- Import the structured content into knowledge bases or LLM systems

## Troubleshooting

### Common Issues

1. **Memory Issues**: If you encounter memory errors, try processing fewer pages at a time using the `-s` and `-e` options

2. **Font Issues**: For documents with special fonts, ensure the necessary font packages are installed in the Docker image

3. **Performance**: CPU-only mode will be slower than GPU-accelerated processing. For large documents, consider using a system with GPU support

## Conclusion

MinerU is a powerful tool for converting documents to machine-readable formats. With Docker, you can easily set up and use MinerU without worrying about complex dependencies or installation issues. This approach is particularly useful for scientific papers and technical documents with complex formulas and symbols.

For more information, visit the [official MinerU documentation](https://mineru.readthedocs.io/).
