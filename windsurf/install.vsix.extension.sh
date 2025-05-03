#!/bin/bash

# Script to automate VSIX extension installation from GitHub

# ANSI color codes for better readability
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}===== VSIX Extension Installer =====${NC}"

# Check if nvm, node and npm are installed
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}Node.js is not installed or not in PATH.${NC}"
    echo -e "${YELLOW}Would you like to install/update Node.js using nvm? (y/n)${NC}"
    read -r install_node
    
    if [[ "$install_node" =~ ^[Yy]$ ]]; then
        echo -e "${GREEN}Installing nvm...${NC}"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        
        echo -e "${GREEN}Installing Node.js 20...${NC}"
        nvm install 20
        nvm use 20
        nvm alias default 20
    else
        echo -e "${RED}Node.js is required for building VSIX extensions. Exiting.${NC}"
        exit 1
    fi
fi

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo -e "${YELLOW}vsce is not installed. Installing now...${NC}"
    npm install -g @vscode/vsce
fi

# Ask for GitHub repository information
echo -e "${BLUE}Enter the GitHub repository SSH link:${NC}"
read -r repo_ssh

# Extract repo name from SSH link
default_repo_name=$(echo "$repo_ssh" | sed -E 's/.*\/([^\/]+)\.git$/\1/')

echo -e "${BLUE}Repository name [$default_repo_name]:${NC}"
read -r repo_name
repo_name=${repo_name:-$default_repo_name}

# Ask which editor to install the extension for
echo -e "${BLUE}Install extension for:${NC}"
echo "1) VSCode"
echo "2) WindSurf"
read -r editor_choice

# Set the editor command based on user choice
if [ "$editor_choice" == "1" ]; then
    editor_cmd="code"
    editor_name="VSCode"
else
    editor_cmd="windsurf"
    editor_name="WindSurf"
fi

# Create a temporary directory for the build
temp_dir=$(mktemp -d)
echo -e "${GREEN}Working in temporary directory: $temp_dir${NC}"

# Clone the repository
echo -e "${GREEN}Cloning repository...${NC}"
cd "$temp_dir" || exit
git clone "$repo_ssh"
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to clone repository. Please check the SSH link and your SSH keys.${NC}"
    exit 1
fi

# Navigate to the repository directory
cd "$repo_name" || exit

# Install dependencies
echo -e "${GREEN}Installing dependencies...${NC}"
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install dependencies.${NC}"
    exit 1
fi

# Package the extension
echo -e "${GREEN}Packaging extension...${NC}"
vsce package
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to package extension.${NC}"
    exit 1
fi

# Find the generated VSIX file
vsix_file=$(find . -name "*.vsix" | head -n 1)
if [ -z "$vsix_file" ]; then
    echo -e "${RED}No VSIX file found after packaging.${NC}"
    exit 1
fi

# Install the extension
echo -e "${GREEN}Installing extension for $editor_name...${NC}"
"$editor_cmd" --install-extension "$vsix_file"
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install extension.${NC}"
    exit 1
fi

echo -e "${GREEN}Extension successfully installed for $editor_name!${NC}"
echo -e "${YELLOW}Temporary files are in $temp_dir${NC}"
echo -e "${YELLOW}You can remove them with: rm -rf $temp_dir${NC}"

# Ask if user wants to clean up
echo -e "${BLUE}Do you want to clean up the temporary files? (y/n)${NC}"
read -r cleanup
if [[ "$cleanup" =~ ^[Yy]$ ]]; then
    rm -rf "$temp_dir"
    echo -e "${GREEN}Temporary files removed.${NC}"
fi

echo -e "${GREEN}All done!${NC}"
