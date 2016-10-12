#!/bin/bash

set -xe

name=$(basename $1)

cd $1

tmux new-session -d -s $name
tmux switch-client -t $name
