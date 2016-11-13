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
    
    bash $FULLPATH/push.sh
    
fi;
