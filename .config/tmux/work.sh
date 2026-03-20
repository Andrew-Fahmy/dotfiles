#!/usr/bin/env bash
if ! tmux switch-client -t work 2> /dev/null; then
    tmux new-session -d -s work -c ~/Vas/
    tmux switch-client -t work

    tmux send-keys "cd vas-sls-integrations/serverless/" Enter
    tmux send-keys "nvim" Enter
    tmux rename-window "vas-sls-integrations"
fi
