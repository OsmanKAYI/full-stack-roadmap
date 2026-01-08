# How to Build and Install VSIX Extension from GitHub

## Problem

- Some VSCode extensions are not available on WindSurf Marketplace. In this case, GistPad by Jonathan Carter.
- The GitHub repository does not provide a direct VSIX download.
- Node.js version on the system is too old for building the extension.

## Solution Steps

### 1. Update Node.js Version

Most modern VSCode extensions require at least Node.js 18 or 20.
It’s easiest to use [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm):

```bash
# Install nvm (if not installed)
curl -o- [https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh](https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh) | bash
source ~/.bashrc  # or source ~/.zshrc

# Install and use Node.js 20
nvm install 20
nvm use 20
nvm alias default 20

# Check versions
node -v
npm -v
```

### 2. Install Required Global Packages

```bash
npm install -g @vscode/vsce
```

### 3. Clone and Build GistPad (you can use any other extension)

```bash
# Clone the repository
git clone [https://github.com/lostintangent/gistpad.git](https://github.com/lostintangent/gistpad.git)
cd gistpad

# Install dependencies
npm install

# Package the extension
vsce package
```

After running these commands, you will have a .vsix file in the gistpad directory.

### 4. Install the VSIX Extension

#### GUI Method

- In WindSurf or VSCode, go to the Extensions panel.
- Select "Install from VSIX..." and choose your packaged `.vsix` file.

#### Terminal Method

```bash
# For VSCode
code --install-extension path/to/your/extension.vsix

# For WindSurf
windsurf --install-extension path/to/your/extension.vsix

# For Antigravity
antigravity --install-extension path/to/your/extension.vsix
```

Note: Replace `path/to/your/extension.vsix` with the actual path to your VSIX file.

### Summary

Update Node.js, install required tools, build the extension from source, and install the generated VSIX file.
