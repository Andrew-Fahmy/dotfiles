#!/usr/bin/env bash
if ! tmux switch-client -t default 2> /dev/null; then
    tmux new-session -d -s default -c ~
    tmux switch-client -t default
    tmux send-keys "cd dotfiles; vim ." Enter
    tmux rename-window "dotfiles"
    tmux new-window -c ~
fi
