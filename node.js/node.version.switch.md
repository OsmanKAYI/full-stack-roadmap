# Managing Node.js Versions with nvm

## Check Current Versions

```bash
node --version
npm --version
```

## Installing nvm

If you don't have nvm installed, you can install it using:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Restart your terminal after installation.

## Basic nvm Commands

### List Installed Node.js Versions

```bash
nvm ls
```

### List Available Node.js Versions

```bash
nvm ls-remote
```

### Install a Specific Version

```bash
nvm install <version>  # e.g., nvm install 18.18.0
```

### Switch to a Specific Version

```bash
nvm use <version>      # e.g., nvm use 18.18.0
```

### Set Default Version

This will be used in new terminal sessions:

```bash
nvm alias default <version>  # e.g., nvm alias default 18.18.0
```

### Check Current Version

```bash
node --version
npm --version
```

## Example Workflow

1. Check current version: `node --version`
2. List installed versions: `nvm ls`
3. Install a new version: `nvm install 18.18.0`
4. Switch to it: `nvm use 18.18.0`
5. Make it default: `nvm alias default 18.18.0`

## Notes

- Use LTS versions for production
- Different projects can use different Node.js versions
- Global packages need to be reinstalled when switching versions
