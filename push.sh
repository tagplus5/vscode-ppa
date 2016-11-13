#!/bin/bash

BASEDIR=`dirname "$0"`
FULLPATH=`cd "$BASEDIR"; pwd`

cd $FULLPATH/ubuntu

dpkg-scanpackages -m . /dev/null 2> /dev/null > Packages
gzip --keep --force -9 Packages

apt-ftparchive release . > Release
gpg --yes --clearsign --digest-algo SHA512 -o InRelease Release
gpg --yes -abs --digest-algo SHA512 -o Release.gpg Release

cd $FULLPATH

GITBRANCH=`git rev-parse --abbrev-ref HEAD`

git add *
git commit -a -m 'update'
git push -q origin $GITBRANCH
