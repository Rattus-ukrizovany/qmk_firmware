# QMK Firmware Codespaces Development Environment

This directory contains the configuration files for developing QMK Firmware using GitHub Codespaces or VS Code Dev Containers.

## What's Included

- **devcontainer.json**: Configuration file that sets up the development container with the QMK CLI Docker image
- **setup.sh**: Post-creation script that initializes the QMK environment

## Using GitHub Codespaces

1. Fork this repository to your GitHub account (if you haven't already)
2. Navigate to your forked repository on GitHub
3. Click the green "Code" button
4. Select the "Codespaces" tab
5. Click "Create codespace on [branch-name]"

GitHub will automatically build the development environment using the configuration in this directory.

## Using VS Code Dev Containers

1. Install the "Dev Containers" extension in VS Code
2. Open this repository in VS Code
3. Press F1 and select "Dev Containers: Reopen in Container"

VS Code will build and start the development container.

## Compiling Firmware

Once your Codespace or Dev Container is running, you can compile firmware using:

### Using QMK CLI:
```bash
qmk compile -kb <keyboard> -km <keymap>
```

### Using Make:
```bash
make <keyboard>:<keymap>
```

### Example:
```bash
qmk compile -kb planck/rev6 -km default
# or
make planck/rev6:default
```

The compiled firmware files (`.hex`, `.bin`, or `.uf2`) will appear in the root directory and will be visible in the VS Code Explorer.

## Flashing Firmware

Since Codespaces runs in the cloud, you cannot directly flash firmware to your keyboard. Instead:

1. Compile your firmware in Codespaces
2. Download the generated `.hex`, `.bin`, or `.uf2` file
3. Flash it to your keyboard on your local machine using [QMK Toolbox](https://github.com/qmk/qmk_toolbox) or another flashing tool

## Environment Details

- **Base Image**: `ghcr.io/qmk/qmk_cli` (official QMK CLI Docker image)
- **Installed Extensions**: EditorConfig, Clang-Format, Clangd, Markdown Preview, Git Extension Pack
- **QMK CLI**: Automatically installed and configured
- **Submodules**: Automatically initialized on container creation

## Customization

You can customize the development environment by editing:
- `devcontainer.json`: Add VS Code extensions, change settings, or modify the container configuration
- `setup.sh`: Add additional setup commands or tools

## Reference

For more information, see:
- [QMK Documentation](https://docs.qmk.fm)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
