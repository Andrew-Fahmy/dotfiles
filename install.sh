#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CONFIG_DIR=$XDG_CONFIG_HOME

if [ -z ${CONFIG_DIR} ]
then
    echo "XDG_CONFIG_HOME not defined, using ~/.config"
    CONFIG_DIR=~/.config
fi

ln -siv $DOTFILES_DIR/config/* $CONFIG_DIR/
ln -siv $DOTFILES_DIR/.zshenv $HOME
