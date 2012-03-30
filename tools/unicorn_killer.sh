#!/bin/bash

max_mem=
while getopts ':m' opt
do
  case $opt in
    m)  
      index=$OPTIND
      eval arg="\$$index"
      max_mem="$arg"
      ;;
  esac
done
if [ "$max_mem" ]
then
  ps -e -www -o pid,rss,command | \
  grep '[u]nicorn_rails worker' | \
  while read worker 
  do
    worker=`echo $worker | sed 's/[[:space:]]+/ /g'`
    if [ $(( `echo $worker | cut -d' ' -f2` > $max_mem)) = 1 ]
    then 
      pid=`echo $worker | cut -d' ' -f1`
      kill -9 $pid
    else
      echo $worker
    fi
  done
else
  echo "Use: ./unicorn_killer.sh -m [MAX_MEMORY]"
fi
