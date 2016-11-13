#!/bin/bash

cd 

git clone --mirror git@github.com:tagplus5/vscode-ppa.git

docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.7* vscode-ppa.git

cd vscode-ppa.git

sudo chown -R $(whoami):$(id -g -n) .

git reflog expire --expire=now --all && git gc --prune=now --aggressive

git push
