#!/bin/sh

ARG="$1"

echo "echo arg=$1";

if [ -z "$1" ] 
then
  echo "Usage: ren-pre-mov prefix (please input prefix for MOV files)";
  exit $E_NOARGS
fi

for file in ./*.mov
do
  echo "$file"
done;

echo "This will attach prefix $pref and get rid of " [1-9]" pattern at the end";
echo "Are sure to rename above files?[y/n]";
read answer;
if [ $answer != "y" ]
then
  echo "Terminating";
fi;


for file in ./*.mov 
do
  fname=`basename $file`;
  echo "Filename: $fname";
  #strlen=${#fname};
  #echo "strlen: $strlen";
  #pos=`expr $strlen - 6`;
  #echo "pos=$pos";
  #tok=${file:0:$pos};
  #echo "tok=$tok";
  #filename=${1}-${tok}.mov;
  filename=${1}-${fname}.mov;
  mv "$file" "$filename";
done;
