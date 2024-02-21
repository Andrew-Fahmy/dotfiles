#!/usr/bin/env bash
if ! tmux switch-client -t default 2> /dev/null; then
    tmux new-session -d -s default -c ~ \; \
        send-keys "cd dotfiles; vim ." Enter \; \
        rename-window "dotfiles" \; \
        new-window -c ~
fi
tmux switch-client -t default
