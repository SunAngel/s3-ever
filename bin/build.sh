#!/bin/sh
#Simple static site generator

cd `dirname $0`/../

############
## Config ##
############
. ./conf/config.def

[ -f ./conf/config ] && . ./conf/config

###############
## Functions ##
###############

send_page () {
	# Output page
	echo "Content-type: text/html"
	echo ""
	cat "$CACHE_DIR/${PAGE}${CACHE_EXT}"
	#env
}

build_file () {
	# Create static page
	cat "$PAGE_HEADER" >  "$CACHE_DIR/${PAGE}${CACHE_EXT}"
	if [ -z "$CONTENT_FILTER" ]; then
		cat "$FILE"  >> "$CACHE_DIR/${PAGE}${CACHE_EXT}"
	else
		$CONTENT_FILTER < "$FILE"  >> "$CACHE_DIR/${PAGE}${CACHE_EXT}"
	fi
	cat "$PAGE_FOOTER" >> "$CACHE_DIR/${PAGE}${CACHE_EXT}"
}

##########
## Main ##
##########

PAGE=`basename "$REQUEST_URI"`

#Is it index?
if [ -z "$PAGE" -o "$PAGE" = '/' ]; then 
	PAGE="index"
	FILE=$PAGE_INDEX
else 
	FILE="$DATA_DIR/${PAGE}${DATA_EXT}"
fi

#Well, we assume, that 404 page does exists
if [ ! -f "$FILE" ]; then
	FILE=$PAGE_404
	PAGE=404

	# Set response status to 404
	echo "Status: 404 Not Found"
	# Do not rebuild 404 page if there is some already
	if [ -f "$CACHE_DIR/${PAGE}${CACHE_EXT}" ]; then
		send_page
		exit;
	fi
fi

build_file
send_page
