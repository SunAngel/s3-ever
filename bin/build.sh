#!/bin/sh
#Simple static site generator

cd `dirname $0`/../

############
## Config ##
############
#Directory where script will store compiled files
CACHE_DIR="./cache"
#Directory, where original files are stored
DATA_DIR="./data"

#Different pages
PAGE_HEADER="./data/default/header.htm"
PAGE_FOOTER="./data/default/footer.htm"
PAGE_404="./data/default/404"
PAGE_INDEX="./data/default/index"

[ -f ./conf/conf ] && . ./conf/conf


FILE=`basename "$REQUEST_URI"`

[ -z "$FILE" ] && FILE="index"
[ "$FILE" = '/' ] && FILE="index"

#Well, we assume, that file 404 does exists
[ -f "./data/$FILE" ] || FILE="404"

cat "./data/header.htm" >  "./cache/${FILE}.htm"
cat "./data/$FILE"  >> "./cache/${FILE}.htm"
cat "./data/footer.htm" >> "./cache/${FILE}.htm"


echo "Content-type: text/html"
echo ""
cat "./cache/${FILE}.htm"
#env
