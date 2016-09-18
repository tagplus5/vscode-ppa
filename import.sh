#!/bin/bash

BASEDIR=`dirname "$0"` 
FULLPATH=`cd "$BASEDIR"; pwd`
mkdir -p $FULLPATH/ubuntu
cd $FULLPATH/ubuntu

# code
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders 
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

dpkg-scanpackages . /dev/null > Packages

gzip --keep --force -9 Packages

apt-ftparchive release . > Release

gpg --yes --clearsign --digest-algo SHA512 -o InRelease Release

gpg --yes -abs --digest-algo SHA512 -o Release.gpg Release

git add *
git commit -m 'update'
git push origin master
