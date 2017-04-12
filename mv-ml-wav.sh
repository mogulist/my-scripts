#!/bin/sh
# Magiclantern 영상 디렉토리에서 WAV 파일을 찾아서 
# WAV 파일 이름을 디렉토리 이름으로 변경하고, 상위 폴더로 이동시킴
# 주의: WAV 파일은 이 스크립트를 실행시키는 CWD로 이동시킨다
# 사용방법: 아무런 인자 없이 실행시키면 된 

ARG="$1"


for file in ./* 
do
  if [[ -d $file ]]
  then 
    echo "$file is directory"; 
    for wavfile in $file/*.wav
    do
      if [ -e $wavfile ] && [ -f $wavfile ]
      then
        echo "Found $wavfile in directory $file";
        newwav=${file}.wav;
        echo "renaming $wavfile to $newwav";
        mv $wavfile $newwav;
      fi
    done;
  elif [[ -f $file ]] 
  then
    echo "$file is regular file"
  else
    echo "$file is unknown type"
  fi
done;
