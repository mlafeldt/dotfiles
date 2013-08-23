#!/bin/sh
# Install dotfiles to $HOME
# Usage: ./install.sh
# Written by Mathias Lafeldt <mathias.lafeldt@gmail.com>

set -e

DOTFILES="bash git ruby vim"
BINDIR="$HOME/bin"

install_dotfiles() {
    echo "+ Installing dotfiles"

    for dir in $DOTFILES; do
        for file in "$dir"/* ; do
            target="$HOME/.$(basename $file)"
            cp -av "$file" "$target"
        done
    done
}

install_vim_plugins() {
    echo "+ Installing Vim plugins"

    # Install Vundle
    VUNDLE_BUNDLE="$HOME/.vim/bundle/vundle"
    test -d "$VUNDLE_BUNDLE" || {
        mkdir -p "$VUNDLE_BUNDLE"
        git clone https://github.com/gmarik/vundle.git "$VUNDLE_BUNDLE"
    }

    # Install godef for vim-godef
    command -v godef >/dev/null 2>/dev/null || {
        go get -v code.google.com/p/rog-go/exp/cmd/godef
        go install -v code.google.com/p/rog-go/exp/cmd/godef
    }

    vim +BundleInstall +qall
}

install_tools() {
    echo "+ Installing tools to $BINDIR"
    mkdir -p "$BINDIR"
    cp -av bin/* "$BINDIR"
}

install_dotfiles
install_vim_plugins
install_tools

:
