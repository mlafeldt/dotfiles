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
    if test -d "$VUNDLE_BUNDLE"; then
        (cd "$VUNDLE_BUNDLE"; git pull)
    else
        mkdir -p "$VUNDLE_BUNDLE"
        git clone https://github.com/gmarik/vundle.git "$VUNDLE_BUNDLE"
    fi

    vim +BundleInstall +qall
}

install_go_tools() {
    echo "+ Installing Go tools"

    # vim-godef
    go get -v -u code.google.com/p/rog-go/exp/cmd/godef
    # vim-gocode
    go get -v -u github.com/nsf/gocode
    go get -v -u code.google.com/p/go.tools/cmd/goimports
    # misc
    go get -v -u code.google.com/p/go.tools/cmd/cover
    go get -v -u code.google.com/p/go.tools/present
    go get -v -u github.com/mitchellh/gox
    go get -v -u github.com/pengwynn/flint
}

install_tools() {
    echo "+ Installing tools to $BINDIR"
    mkdir -p "$BINDIR"
    cp -av bin/* "$BINDIR"
}

install_dotfiles
install_vim_plugins
install_go_tools
install_tools

:
