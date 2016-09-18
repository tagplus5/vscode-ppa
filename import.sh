#!/bin/bash

BASEDIR=`dirname "$0"` 
FULLPATH=`cd "$BASEDIR"; pwd`
mkdir -p $FULLPATH/ppa
cd $FULLPATH/ppa

KEYNAME=350E178B

# code
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders 
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

dpkg-scanpackages . /dev/null |gzip > Packages.gz

apt-ftparchive packages . > Packages
bzip2 -kf Packages

apt-ftparchive release . > Release
gpg --clearsign -o InRelease Release
#gpg -abs -o Release.gpg Release
gpg --yes -abs -u $KEYNAME -o Release.gpg Release

#dpkg-sig --sign builder *.deb
dpkg-sig -k $KEYNAME -s builder *.deb

git add *
git commit -m 'update'
git push origin master
