#!/bin/sh
#first arg is new repository name
#second arg is current directory in wizwid-all/ 

if [ $# != 2 ] 
then
  echo "Usage: input two arguments";
  exit;
fi;

echo "arg1=$1, arg2=$2";
if [ -e $1 ] 
then
  echo "$1 already exists in this directory. please input other repository name.";
  exit 0;
fi;

second_dir="wizwid-all/$2";
echo "$second_dir"

if [ -e $second_dir ] && [ -d $second_dir ]
then
  echo "$2 is to be splitted";
else
  echo "Cannot find wizwid-all/$2 . Exits.";
  exit 0
fi;
date

git clone wizwid-all $1;
cd $1;
git filter-branch --prune-empty --subdirectory-filter $2 master
git branch
git count-objects -vH

date

