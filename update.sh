#!/bin/bash

BASEDIR=`dirname "$0"` 
FULLPATH=`cd "$BASEDIR"; pwd`
cd $FULLPATH

mkdir -p $FULLPATH/ubuntu
cd $FULLPATH/ubuntu

COUNT1=`ls -1 | wc -l`

# code
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760868

# code-insiders
wget -q --content-disposition -N https://go.microsoft.com/fwlink/?LinkID=760865

COUNT2=`ls -1 | wc -l`

for n in 0 1 2 3 4 5 6 7 8 9
do
	rename "s/\\.$n\./.0$n./g" *.deb -f
  rename "s/\\.$n\./.0$n./g" *.deb -f
done

ls -F code_*.deb | head -n -5 | xargs rm 2> /dev/null
ls -F code-insiders_*.deb | head -n -5 | xargs rm 2> /dev/null

if [ "$COUNT1" != "$COUNT2" ]; then    
  echo 1
else
  echo 0
fi
