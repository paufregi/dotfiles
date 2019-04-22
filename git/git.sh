#!/usr/bin/env bash

REPO="git"
GIT_CONFIG=".gitconfig"
GIT_IGNORE=".gitignore_global"

function backup(){
    FILE=$1

    if [[ -e "$FILE" ]]; then
        echo "Back up $FILE -> $FILE.back"
        mv "$FILE" "$FILE".back
    fi
}

# Backup .gitconfig
backup "$HOME/$GIT_CONFIG"
backup "$HOME/$GIT_IGNORE"

# Copy .gitconfig and .gitignore_global
cp -f "$REPO/$GIT_CONFIG" "$HOME/$GIT_CONFIG"
cp -f "$REPO/$GIT_IGNORE" "$HOME/$GIT_IGNORE"
