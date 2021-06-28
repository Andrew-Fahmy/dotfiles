#!/usr/bin/env bash
if ! tmux switch-client -t mao 2> /dev/null; then
    tmux new-session -d -s mao -c ~/projects/mao
    tmux switch-client -t mao
    tmux send-keys "vim ." Enter
    tmux rename-window "editor"
    tmux new-window -c ~/projects/mao
    tmux send-keys "expo start" Enter
fi
