#!/usr/bin/env bash

set -eEuo pipefail

echo "Setting up QMK Firmware development environment..."

# Install/upgrade pip and QMK CLI
echo "Installing QMK CLI..."
wget -q https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --quiet
python3 -m pip install --quiet --upgrade qmk
rm get-pip.py

# Upgrade milc (QMK CLI dependency)
python3 -m pip install --quiet --upgrade milc

# Mark the workspace as a safe directory for git
workspacePath="$1"
echo "Configuring git safe directory..."
git config --global --add safe.directory "$workspacePath"

# Initialize submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Set up QMK configuration
echo "Setting up QMK configuration..."
qmk config user.qmk_home="$workspacePath"

# Run QMK setup to initialize submodules
echo "Running QMK setup..."
qmk git-submodule

echo "QMK Firmware development environment setup complete!"
echo "You can now compile firmware using: qmk compile -kb <keyboard> -km <keymap>"
echo "Or use: make <keyboard>:<keymap>"
