#!/bin/sh
#Simple static site generator

cd `dirname $0`/../

############
## Config ##
############
. ./conf/config.def

[ -f ./conf/config ] && . ./conf/config

rm -v $CACHE_DIR/*
