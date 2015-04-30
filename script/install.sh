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
    VUNDLE_BUNDLE="$HOME/.vim/bundle/Vundle.vim"
    if test -d "$VUNDLE_BUNDLE"; then
        (cd "$VUNDLE_BUNDLE"; git pull)
    else
        mkdir -p "$VUNDLE_BUNDLE"
        git clone https://github.com/gmarik/Vundle.vim.git "$VUNDLE_BUNDLE"
    fi

    vim +PluginInstall +GoInstallBinaries +qa
}

install_go_tools() {
    echo "+ Installing Go tools"
    GO_GET="go get -v"
    $GO_GET golang.org/x/tools/cmd/cover
    $GO_GET golang.org/x/tools/cmd/godoc
    $GO_GET golang.org/x/tools/cmd/vet
    $GO_GET golang.org/x/tools/cmd/present
    $GO_GET github.com/mitchellh/gox
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