#!/bin/bash

if [ -z "$1" ]; then
   echo "./tfidf <topics> <collection>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./tfidf <topics> <collection>"
   exit 1;
fi
col=$2

base=/data/biocaddie
mkdir -p output/tfidf/$col/$topics
for b in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 
do
   for k1 in 0 0.2 0.5 0.7 1.0 1.2 1.5 1.7 2.0
   do 
      IndriRunQuery -index=$base/indexes/biocaddie_all/ -trecFormat=true -baseline=tfidf,k1:$k1,b:$b queries/queries.$col.$topics > output/tfidf/$col/$topics/k1=$k1:b=$b.out
   done
done

