workingDir=`dirname "$0"`
cd "${workingDir}"

sudo mv ./mlv_dump.osx /usr/bin/mlv_dump
sudo chmod +x /usr/bin/mlv_dump

for FILE in `ls -A1 *.MLV *.mlv 2>/dev/null`; do
    BASE=`echo $FILE | cut -d "." -f1`;
    mkdir $BASE;
    mv ./"$BASE".M* ./$BASE
    cd ./$BASE
    /usr/bin/mlv_dump -x $FILE
    /usr/bin/mlv_dump --dng -o ${BASE}_frame_ $FILE
    /usr/bin/mlv_dump -m -o meta.mlv $FILE
    /usr/bin/mlv_dump -v meta.mlv >$FILE.txt
    cat ./$FILE.txt | grep String >$FILE-take.txt
    rm ./meta.mlv
    rm ./meta.mlv.wav
    rm ./$BASE.IDX
    cd ..
done
exit

