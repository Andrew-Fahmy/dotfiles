#!/usr/bin/env bash
if ! tmux switch-client -t work 2> /dev/null; then
    tmux new-session -d -s work -c ~/work/tpb
    tmux switch-client -t work
    tmux send-keys "vim ." Enter
    tmux rename-window "editor"
fi
