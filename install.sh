#!/bin/sh
# Install dotfiles to $HOME
# Usage: ./install.sh
# Written by Mathias Lafeldt <mathias.lafeldt@gmail.com>

set -e

install_configs() {
    INSTALL_DIRS="bash git ruby vim"

    echo "+ Installing config files"

    for dir in $INSTALL_DIRS; do
        for file in "$dir"/* ; do
            target="$HOME/.$(basename $file)"
            rm -f "$target"
            cp -v "$file" "$target"
        done
    done
}

install_vundle() {
    VUNDLE_BUNDLE="$HOME/.vim/bundle/vundle"

    echo "+ Installing Vundle for Vim"

    test -d "$VUNDLE_BUNDLE" || {
        mkdir -p "$VUNDLE_BUNDLE"
        git clone https://github.com/gmarik/vundle.git "$VUNDLE_BUNDLE"
    }

    vim +BundleInstall +qall
}

install_tools() {
    BIN_DIR="$HOME/bin"

    echo "+ Installing tools to $BIN_DIR"

    mkdir -p "$BIN_DIR"
    cp -v bin/* "$BIN_DIR"
}

install_configs
install_vundle
install_tools

:
