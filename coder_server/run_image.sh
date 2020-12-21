#!/bin/bash
home_dir=$HOME
docker run --gpus all -d -p 8080:8080 -v /home/blake/code-server:/home/coder/.local/share/code-server -v /home/blake:/home/coder/project -v $home_dir/.gitconfig:/home/coder/.gitconfig -v $home_dir/.ssh:/home/coder/.ssh -v $home_dir/.vscode/extensions:/home/coder/.local/share/code-server/extensions -v /var/run/docker.sock:/var/run/docker.sock --restart=always code-server-gpu
