#!/bin/bash

SESSION="FRONTEND"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_frontend/"

    tmux rename-window -t "$SESSION:0" 'CODE'
    tmux send-keys -t "$SESSION:0" 'nvim .' C-m

    tmux new-window -t "$SESSION:1" -n "SERVER" -c "/home/sriram/git/intern/ims_frontend/"
    tmux send-keys -t "$SESSION:1" 'npm run dev' C-m

    tmux select-window -t "$SESSION:0"

    echo "FRONTEND Session created"
fi

