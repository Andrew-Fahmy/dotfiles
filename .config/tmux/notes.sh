#!/usr/bin/env bash
if ! tmux switch-client -t notes 2> /dev/null; then
    tmux new-session -d -s notes -c ~/Notes/
    tmux switch-client -t notes

    tmux send-keys "nvim" Enter
    tmux rename-window "Notes"
fi
