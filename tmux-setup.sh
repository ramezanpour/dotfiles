#!/bin/sh

SESSION="Dev"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" = "" ]
then

# AutoComp
tmux new-session -d -n autocomp -s $SESSION
tmux send-keys -t autocomp 'cd ~/projects/dh-cc-automations' C-m

tmux split-window -l 10% -t autocomp
tmux send-keys -t autocomp 'cd ~/projects/dh-cc-automations' C-m 'poetry shell' C-m

# CTS window
tmux new-window -t $SESSION -n cts
tmux send-keys -t cts 'cd ~/projects/gcc-contact-tracing' C-m
tmux split-window -l 10% -t cts
tmux send-keys -t cts 'cd ~/projects/gcc-contact-tracing' C-m 'poetry shell' C-m

# Tasks window
tmux new-window -t $SESSION -n tasks

tmux select-window -t autocomp
tmux a
else
    # session exists try to attech it only
    tmux a
fi
