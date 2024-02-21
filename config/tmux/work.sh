#!/usr/bin/env bash
if ! tmux switch-client -t work 2> /dev/null; then
    tmux new-session -d -s work -c ~/Vas/
    tmux switch-client -t work

    tmux send-keys "cd vas-sls-integrations/serverless/" Enter
    tmux send-keys "nvim" Enter
    tmux rename-window "vas-sls-integrations"

    tmux new-window -c ~/Vas/
    tmux send-keys "cd vas-api-developer/src/serverless/" Enter
    tmux send-keys "nvim" Enter
    tmux rename-window "vas-api-developer"

    tmux new-window -c ~/Vas/
    tmux send-keys "cd vas-sdk-typescript/src/packages/" Enter
    tmux send-keys "nvim" Enter
    tmux rename-window "vas-sdk-typescript"
fi
