#!/bin/bash

set -e
set -o pipefail

DOTFILES="bash git ruby vim"
BINDIR="$HOME/bin"

install_brew_tools() {
    (
        cd homebrew &&
        brew bundle --verbose &&
        brew bundle cleanup --force --verbose &&
        brew cleanup
    )
}

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

install_tools() {
    echo "+ Installing tools to $BINDIR"
    mkdir -p "$BINDIR"
    cp -av bin/* "$BINDIR"
}

install_dotfiles
install_brew_tools
install_tools
install_vim_plugins

:
