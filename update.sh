#!/bin/sh

set -e

cd homebrew
brew bundle dump --file=- | sort > Brewfile
git commit -m "Update Brewfile" .
git show HEAD
