#!/bin/bash

BASEDIR=`dirname "$0"`
FULLPATH=`cd "$BASEDIR"; pwd`
cd $FULLPATH

function cleanRepo() {
  docker run --rm \
  -v $FULLPATH/root:/root \
  -v $FULLPATH:/app \
  tagplus5/ubuntu-ppa git clone --mirror git@github.com:tagplus5/vscode-ppa.git app.git

  docker run --rm \
  -v $FULLPATH:/data \
  tagplus5/git-bfg --delete-files *.deb app.git

  docker run --rm \
  -v $FULLPATH/app.git:/app \
  tagplus5/ubuntu-ppa bash -c "git reflog expire --expire=now --all && git gc --prune=now --aggressive"

  docker run --rm \
  -v $FULLPATH/root:/root \
  -v $FULLPATH/app.git:/app \
  tagplus5/ubuntu-ppa git push

  docker run --rm \
  -v $FULLPATH:/app \
  tagplus5/ubuntu-ppa rm -rf app.git
}

function newGit() {
  docker run --rm \
  -v $FULLPATH/root:/root \
  -v $FULLPATH:/app \
  tagplus5/ubuntu-ppa bash -c "rm -rf .git && \
    git clone git@github.com:tagplus5/vscode-ppa.git app.git && \
    mv app.git/.git /app/.git && \
    rm -rf app.git"
}

cleanRepo
newGit
