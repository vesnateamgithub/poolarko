#!/bin/bash
#
# compress: tar -cvjf poolapp.tar.bz2 ...
# list: tar -tvf poolapp.tar.bz2  
# uncompress: tar -xvf poolapp.tar.bz2
#
d=$(date +%Y%m%d)
filename="poolarko_"$d"_"$$".tar.bz2"
rm *.*.bz2 2>/dev/null
tar --exclude *.tar.bz2 --exclude='./log' --exclude='./.env' --exclude='./main' -cvjf "$filename" . 

# copy to s3
aws s3 cp "$filename" s3://vesnateam.com



