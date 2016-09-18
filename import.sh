#!/bin/bash

BASEDIR=`dirname "$0"` 
FULLPATH=`cd "$BASEDIR"; pwd`

cd $FULLPATH

# code
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders 
wget --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

dpkg-scanpackages . /dev/null |gzip > Packages.gz

git add * 
git commit -m 'update'
git push origin master
