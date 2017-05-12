#!/bin/bash

if [ -z "$1" ]; then
   echo "./dir.sh <topics> <collection>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./dir.sh <topics> <collection>"
   exit 1;
fi
col=$2

base=/data/biocaddie
mkdir -p output/dir-krovetz/$col/$topics
#for mu in 100 250 500 750 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
for mu in 50 100 250 500 1000 2500 5000 10000
do
   IndriRunQuery -index=$base/indexes/biocaddie_all.krovetz/ -trecFormat=true -rule=method:dir,mu:$mu queries/queries.$col.$topics > output/dir-krovetz/$col/$topics/$mu.out
done