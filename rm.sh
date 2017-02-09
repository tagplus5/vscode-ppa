#!/bin/bash

cd /tmp

git clone --mirror git@github.com:tagplus5/vscode-ppa.git

docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.1.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.2.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.3.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.4.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.5.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.6.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.7.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.8.* vscode-ppa.git
docker run -it --rm -v `pwd`:/data tagplus5/git-bfg --delete-files code-insiders_1.9.* vscode-ppa.git

sudo chown -R $(whoami):$(id -g -n) vscode-ppa.git

cd vscode-ppa.git

git reflog expire --expire=now --all && git gc --prune=now --aggressive

git push

cd /tmp

rm -rf vscode-ppa.git
