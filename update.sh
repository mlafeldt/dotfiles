#!/bin/sh

update_homebrew() {
    echo "+ Updating homebrew"
    ./bin/brew-upgrade
}

update_vim_plugins() {
    echo "+ Cleaning up Vim plugins"
    vim +BundleClean +qall

    echo "+ Updating Vim plugins"
    vim +BundleUpdate +qall
}

update_homebrew
update_vim_plugins

:
