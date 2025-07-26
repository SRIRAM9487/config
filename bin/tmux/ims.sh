#!/bin/bash

SESSION="BACKEND"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_backend/microservice/user-management/"

    tmux rename-window -t "$SESSION:0" 'CODE'
    tmux send-keys -t "$SESSION:0" 'nvim .' C-m

    tmux new-window -t "$SESSION:1" -n "SERVER" -c "/home/sriram/git/intern/ims_backend/microservice/user-management/"
    tmux send-keys -t "$SESSION:1" 'h' C-m

    tmux select-window -t "$SESSION:0"

    echo "BACKEND Session created"
fi


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


SESSION="DOCKER"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_backend/docker/"

    tmux rename-window -t "$SESSION:0" 'docker'
    tmux send-keys -t "$SESSION:0" 'sudo systemctl start docker;docker-compose up' C-m

    tmux select-window -t "$SESSION:0"

    echo "DOCKER Session created"
fi

