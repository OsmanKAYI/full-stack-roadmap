#!/bin/bash

# install_and_run_mineru.sh
# This script automates the installation and usage of MinerU with Docker

set -e  # Exit immediately if a command exits with a non-zero status

echo "=== MinerU Docker Installation and Usage Script ==="
echo ""

# Function to display usage information
show_usage() {
  echo "Usage: $0 [options] <input_file>"
  echo ""
  echo "Options:"
  echo "  -o, --output DIR     Output directory (default: ./mineru_output)"
  echo "  -m, --method METHOD  Conversion method: ocr, txt, auto (default: auto)"
  echo "  -l, --lang LANG      Language code for OCR (default: en)"
  echo "  -s, --start PAGE     Starting page number (default: process all)"
  echo "  -e, --end PAGE       Ending page number (default: process all)"
  echo "  -d, --debug          Enable debug mode"
  echo "  -h, --help           Show this help message"
  echo ""
  echo "Example: $0 -o my_output -m ocr -l en document.pdf"
  exit 1
}

# Default values
OUTPUT_DIR="./mineru_output"
METHOD="auto"
LANG="en"
START_PAGE=""
END_PAGE=""
DEBUG=""
INPUT_FILE=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -o|--output)
      OUTPUT_DIR="$2"
      shift 2
      ;;
    -m|--method)
      METHOD="$2"
      shift 2
      ;;
    -l|--lang)
      LANG="$2"
      shift 2
      ;;
    -s|--start)
      START_PAGE="$2"
      shift 2
      ;;
    -e|--end)
      END_PAGE="$2"
      shift 2
      ;;
    -d|--debug)
      DEBUG="true"
      shift
      ;;
    -h|--help)
      show_usage
      ;;
    -*)
      echo "Unknown option: $1"
      show_usage
      ;;
    *)
      INPUT_FILE="$1"
      shift
      ;;
  esac
done

# Check if input file is provided
if [ -z "$INPUT_FILE" ]; then
  echo "Error: No input file specified"
  show_usage
fi

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found"
  exit 1
fi

# Get absolute path of input file and output directory
INPUT_FILE_ABS=$(realpath "$INPUT_FILE")
OUTPUT_DIR_ABS=$(realpath "$OUTPUT_DIR")

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR_ABS"

# Clone MinerU repository if it doesn't exist
if [ ! -d "MinerU" ]; then
  echo "Cloning MinerU repository..."
  git clone https://github.com/opendatalab/MinerU.git
fi

# Create CPU Dockerfile if it doesn't exist
if [ ! -f "MinerU/docker/global/Dockerfile.cpu" ]; then
  echo "Creating CPU Dockerfile..."
  mkdir -p MinerU/docker/global
  cat > MinerU/docker/global/Dockerfile.cpu << 'EOF'
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
EOF
fi

# Check if Docker image exists, build if it doesn't
if ! docker images | grep -q "mineru-cpu"; then
  echo "Building MinerU Docker image (this may take some time)..."
  (cd MinerU/docker/global && docker build -t mineru-cpu:latest -f Dockerfile.cpu .)
fi

# Prepare command arguments
CMD_ARGS=""

if [ -n "$METHOD" ]; then
  CMD_ARGS="$CMD_ARGS -m $METHOD"
fi

if [ -n "$LANG" ]; then
  CMD_ARGS="$CMD_ARGS -l $LANG"
fi

if [ -n "$START_PAGE" ]; then
  CMD_ARGS="$CMD_ARGS -s $START_PAGE"
fi

if [ -n "$END_PAGE" ]; then
  CMD_ARGS="$CMD_ARGS -e $END_PAGE"
fi

if [ -n "$DEBUG" ]; then
  CMD_ARGS="$CMD_ARGS -d true"
fi

# Get the directory containing the input file
INPUT_DIR=$(dirname "$INPUT_FILE_ABS")
FILE_NAME=$(basename "$INPUT_FILE_ABS")

# Run MinerU Docker container
echo "Processing file: $INPUT_FILE"
echo "Output directory: $OUTPUT_DIR_ABS"
echo "Method: $METHOD"
echo "Language: $LANG"
echo ""

echo "Running MinerU..."
docker run --rm \
  -v "$INPUT_DIR":/data_in \
  -v "$OUTPUT_DIR_ABS":/data_out \
  mineru-cpu:latest \
  magic-pdf -p "/data_in/$FILE_NAME" -o /data_out $CMD_ARGS

echo ""
echo "=== Processing complete! ==="
echo "Output files are available in: $OUTPUT_DIR_ABS"
