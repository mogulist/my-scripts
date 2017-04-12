#!/bin/sh

ARG="$1"

for file in ./*.MLV
do
  filename=${file%.*V}
  mkdir $filename
  ../mlv_dump.osx --dng $file -o $filename/$filename-
done;
