#!/bin/sh

set -- $(stty size) # $1 = rows $2 = columns
tmux new-session -d -s hofsiedge-session -x "$2" -y "$(($1 - 1))"
tmux select-window -t 0
tmux split-window -v -l 5
tmux send-keys -t hofsiedge-session:0.1 'source .venv/bin/activate 2> /dev/null && clear || source ../.venv/bin/activate 2> /dev/null && clear || echo "Virtual environment not found"' Enter
tmux select-pane -t hofsiedge-session:0.0
tmux split-window -h 'vim .'
tmux split-window -v -l 15 'vim .'
tmux select-pane -t hofsiedge-session:0.0
tmux split-window -v -l 15 'vim .'
tmux send-keys -t hofsiedge-session:0.0 'vim .' Enter
tmux select-pane -t hofsiedge-session:0.0
tmux attach-session -t hofsiedge-session
