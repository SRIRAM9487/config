#!/bin/bash

SESSION="BACKEND"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/PROJECT/DWise/backend/"

    tmux rename-window -t "$SESSION:0" 'CODE'
    tmux send-keys -t "$SESSION:0" 'nvim .' C-m

    tmux new-window -t "$SESSION:1" -n "SERVER" -c "/home/sriram/git/PROJECT/DWise/backend/"
    tmux send-keys -t "$SESSION:1" 'h' C-m

    tmux select-window -t "$SESSION:0"

    echo "BACKEND Session created"
fi


SESSION="FRONTEND"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/PROJECT/DWise/frontend/"

    tmux rename-window -t "$SESSION:0" 'CODE'
    tmux send-keys -t "$SESSION:0" 'nvim .' C-m

    tmux new-window -t "$SESSION:1" -n "SERVER" -c "/home/sriram/git/PROJECT/DWise/frontend/"
    tmux send-keys -t "$SESSION:1" 'npm run dev' C-m

    tmux select-window -t "$SESSION:0"

    echo "FRONTEND Session created"
fi
