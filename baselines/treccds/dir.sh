#!/bin/bash

if [ -z "$1" ]; then
   echo "./dir.sh <topics> <collection> <year>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./dir.sh <topics> <collection> <year>"
   exit 1;
fi
col=$2

if [ -z "$3" ]; then
   echo "./dir.sh <topics> <collection> <year>"
   exit 1;
fi
year=$3

base=/data/treccds
mkdir -p $base/output/$year/dir/$col/$topics
for mu in 50 250 500 1000 2500 5000 10000
do
   echo "IndriRunQuery -index=$base/indexes/treccds${year}_all/ -trecFormat=true -rule=method:dir,mu:$mu $base/queries/$year/queries.$col.$topics > $base/output/$year/dir/$col/$topics/$mu.out"
done