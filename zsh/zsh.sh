#!/bin/bash

function usage() {
    echo "Usage: $0 [command]"
}

function trace() {
    echo "! $@" >&2; $@
}

REPO="zsh"
ZSH_RC=".zshrc"
ZSH_HOME="$HOME/.zsh"

function init() {
    # Setup folder
    if [[ -d "$ZSH_HOME" ]]; then
        echo "$ZSH_HOME already exists."
        exit 1
    fi

    mkdir "$ZSH_HOME"

    # Install plugins
    install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
    install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions.git"
    install_plugin "zsh-history-substring-search" "https://github.com/zsh-users/zsh-history-substring-search.git"
    install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

    # Backup .zshrc
    backup "$HOME/$ZSH_RC"

    # Copy .zsh folder and .zshrc
    cp zsh/*.zsh "$ZSH_HOME"
    cp zsh/.zshrc "$HOME/$ZSH_RC"
}

function update() {
    if [[ ! -d "$ZSH_HOME" ]]; then
        echo "$ZSH_HOME doesn't exists."
        exit 1
    fi

    if [[ ! -e "$HOME/$ZSH_RC" ]]; then
        echo "$ZSH_RC doesn't exists."
        exit 1
    fi

    # Update plugins
    update_plugin "zsh-autosuggestions"
    update_plugin "zsh-completions"
    update_plugin "zsh-history-substring-search"
    update_plugin "zsh-syntax-highlighting"

    # Copy .zsh folder and .zshrc
    cp -f "$REPO"/*.zsh "$ZSH_HOME"
    cp -f "$REPO/$ZSH_RC" "$HOME/$ZSH_RC"
}

function backup(){
    FILE=$1

    if [[ -e "$FILE" ]]; then
        echo "Back up $FILE -> $FILE.back"
        mv "$FILE" "$FILE".back
    fi
}

function install_plugin(){
    plugin=$1
    repo=$2
    folder="$ZSH_HOME/repos/$plugin"

    if [[ -d  "$folder" ]]; then
        echo "$plugin already exists."
        echo
    else
        echo ">> Download $plugin"
        git clone "$repo" "$folder"
        echo
    fi
}

function update_plugin(){
    plugin=$1
    folder="$ZSH_HOME/repos/$plugin"

    if [[ -e  "$folder" ]]; then
        echo ">> Update $plugin"
        (cd "$folder" && git pull)
        echo
    else
        echo "$plugin not installed. Run './dotfiles init'"
    fi
}

if [[ $# -ne 1 ]]; then
    usage
    exit 1
fi

COMMAND=$1

case "$COMMAND" in
	init)
	   init
	   ;;
	update)
	   update
	   ;;
	*)
	   usage
           ;;
esac