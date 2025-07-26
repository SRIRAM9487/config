#!/bin/bash

SESSION="BACKEND"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else

    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_backend/microservice/service_registry/"

    tmux rename-window -t "$SESSION:0" 'REGISTRY'
    tmux send-keys -t "$SESSION:0" 'nvim .' C-m

##    tmux new-window -t "$SESSION:1" -n "CONFIG" -c "/home/sriram/git/intern/ims_backend/microservice/config_server/"
##    tmux send-keys -t "$SESSION:1" 'nvim .' C-m

    tmux new-window -t "$SESSION:1" -n "GATEWAY" -c "/home/sriram/git/intern/ims_backend/microservice/gateway_service/"
    tmux send-keys -t "$SESSION:1" 'nvim .' C-m

    tmux new-window -t "$SESSION:2" -n "AUTH" -c "/home/sriram/git/intern/ims_backend/microservice/auth_service/"
    tmux send-keys -t "$SESSION:2" 'nvim .' C-m

    tmux new-window -t "$SESSION:3" -n "ACADEMIC" -c "/home/sriram/git/intern/ims_backend/microservice/academic_service/"
    tmux send-keys -t "$SESSION:3" 'nvim .' C-m

    tmux new-window -t "$SESSION:4" -n "AUDIT" -c "/home/sriram/git/intern/ims_backend/microservice/audit_service/"
    tmux send-keys -t "$SESSION:4" 'nvim .' C-m

    tmux select-window -t "$SESSION:0"

    echo "BACKEND Session created"
fi

SESSION="SERVER"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else

    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_backend/microservice/service_registry/"

    tmux rename-window -t "$SESSION:0" 'REGISTRY'
    tmux send-keys -t "$SESSION:0" 'h' C-m

 ##   tmux new-window -t "$SESSION:1" -n "CONFIG" -c "/home/sriram/git/intern/ims_backend/microservice/config_server/"
 ##   tmux send-keys -t "$SESSION:1" 'h' C-m

    tmux new-window -t "$SESSION:1" -n "GATEWAY" -c "/home/sriram/git/intern/ims_backend/microservice/gateway_service/"
    tmux send-keys -t "$SESSION:1" 'h' C-m

    tmux new-window -t "$SESSION:2" -n "AUTH" -c "/home/sriram/git/intern/ims_backend/microservice/auth_service/"
    tmux send-keys -t "$SESSION:2" 'h' C-m

    tmux new-window -t "$SESSION:3" -n "ACADEMIC" -c "/home/sriram/git/intern/ims_backend/microservice/academic_service/"
    tmux send-keys -t "$SESSION:3" 'h' C-m

    tmux new-window -t "$SESSION:4" -n "AUDIT" -c "/home/sriram/git/intern/ims_backend/microservice/audit_service/"
    tmux send-keys -t "$SESSION:4" 'h' C-m

    tmux select-window -t "$SESSION:0"

    echo "SERVER Session created"
fi


SESSION="DOCKER"

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session '$SESSION' already running. Attaching..."
else
    tmux new-session -d -s "$SESSION" -c "/home/sriram/git/intern/ims_backend/docker/"

    tmux rename-window -t "$SESSION:0" 'docker'
    tmux send-keys -t "$SESSION:0" 'docker-compose up' C-m

    tmux select-window -t "$SESSION:0"

    echo "DOCKER Session created"
fi

