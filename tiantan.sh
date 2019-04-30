#!/bin/bash
#
if [ -d $1 ]
then
    rm -rf $1
fi

mkdir $1 && cd $1

int=0
for int in $(seq 1 $2)
do
    sleep 1
    if [ $int == $2 ]
    then
        name=$(printf $3'.jpg' $int)
    else
        name=$(printf $3'-%03d.jpg' $int)
    fi

    echo $name

    curl "http://img.ivsky.com/img/bizhi/pic/"$name -o $(printf '%03d.jpg' $int) -H "Referer: http://www.ivsky.com/download_pic.html?picurl=/img/bizhi/pic/"$name -H "Cookie: Hm_lvt_862071acf8e9faf43a13fd4ea795ff8c=1553736085,1553855374; BDTUJIAID=10eae9833d5ae83acad459f8355ea1e8; Hm_lpvt_862071acf8e9faf43a13fd4ea795ff8c=1553861459" -H "Cache-Control: max-age=0" --compressed
done
