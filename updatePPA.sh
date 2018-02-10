#!/bin/bash

BASEDIR=`dirname "$0"`
FULLPATH=`cd "$BASEDIR"; pwd`

cd $FULLPATH/ubuntu

dpkg-scanpackages -m . > Packages
gzip --keep --force -9 Packages

apt-ftparchive release . > Release
gpg --yes --clearsign --digest-algo SHA512 -o InRelease Release
gpg --yes -abs --digest-algo SHA512 -o Release.gpg Release
