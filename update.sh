#!/bin/sh

set -e

cd homebrew
brew bundle dump --force
git commit -m "Update Brewfile" .
