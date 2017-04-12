#!/bin/sh
#if there are many repository at current directory, 
#this script clones each repository to designated target directory.
#first arg is target directory where new repository will be cloned

#Check number of arguments
if [ $# != 1 ] 
then
  echo "Usage: input an argument";
  exit;
fi;

#Check target directory is valid
if [ -d $1 ] 
then
  echo "target directory exist"
else
  echo "Error: target directory does not exist.";
  exit 0;
fi;
#cwd=${PWD##*/}
cwd=$PWD
echo "Current direcotry is $cwd"

for repo in *
do
  if [ -d $repo ] && [ -e $repo/.git ]
  then 
    echo "$repo is git repository to be cloned #########";
    target="$1/$repo";
    echo "git clone $repo $target";
    date;
    cd $cwd;    
    git clone $repo $target;
    echo "Git purging new repository, $target";
    cd $target
    pwd;
    du -d1 -h
    git reset --hard
    git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    git reflog expire --expire=now --all
    git gc --aggressive --prune=now
    du -d1 -h
    date;
    echo "";
    cd $cwd
  else
    echo "* $repo will not be cloned.";
  fi;
done;

