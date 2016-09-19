#!/bin/bash

BASEDIR=`dirname "$0"` 
FULLPATH=`cd "$BASEDIR"; pwd`
mkdir -p $FULLPATH/ubuntu
cd $FULLPATH/ubuntu

git pull

COUNT1=`ls -1 | wc -l`

# code
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

COUNT2=`ls -1 | wc -l`

if [ "$COUNT1" != "$COUNT2" ]; then
    
    dpkg-scanpackages . /dev/null > Packages
    gzip --keep --force -9 Packages
    
    apt-ftparchive release . > Release
    gpg --yes --clearsign --digest-algo SHA512 -o InRelease Release
    gpg --yes -abs --digest-algo SHA512 -o Release.gpg Release
    
    git add *
    git commit -m 'update'
    git push origin master
fi;
