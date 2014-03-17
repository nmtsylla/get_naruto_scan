#!/bin/bash

mkdir $1

echo "`curl http://www.mangareader.net/naruto/$1/1 | grep -E \"of [0-9]{1,2}\" > codehtml`"

numbpage=`cat codehtml | tr -dc [0-9]`

for i in `seq 0 $numbpage`;
do

echo "`curl www.mangareader.net/naruto/$1/$i | grep -Eo \"(http://)[a-z0-9]+\.(mangareader.net/naruto/$1/)[a-zA-Z0-9-]+\.(jpg)\" | xargs curl -o $1/$i.jpg`"

done
echo "finish"
