#!/bin/bash

BASEDIR=`dirname "$0"`
FULLPATH=`cd "$BASEDIR"; pwd`
cd $FULLPATH

git pull

mkdir -p $FULLPATH/ubuntu
cd $FULLPATH/ubuntu

COUNT1=`ls -1 | wc -l`

# code
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

COUNT2=`ls -1 | wc -l`

if [ "$COUNT1" != "$COUNT2" ]; then
    
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
fi;
