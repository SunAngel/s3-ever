#!/bin/sh

#Simple static site generator
# $1 - file name

cd `dirname $0`

FILE=`basename "$1"`

#Well, we assume, that file 404 does exists
[ -f "./data/$FILE" ] || FILE="404"

cat "./data/header.htm" >  "./cache/$FILE"
cat "./data/$FILE.htm"  >> "./cache/$FILE"
cat "./data/footer.htm" >> "./cache/$FILE"


echo "Content-type: text/html"
echo ""
cat "./cache/$FILE"
