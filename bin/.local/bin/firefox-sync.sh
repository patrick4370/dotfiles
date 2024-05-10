#!/usr/bin/env bash
#===============================================================================
#
#          FILE: firefox-sync.sh
#
#         USAGE: ./firefox-sync.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 17/10/22 13:06:09
#      REVISION:  ---
#===============================================================================

static=static-$1
link=$1
volatile=/dev/shm/firefox-$1-$USER

IFS=
set -efu

cd ~/.mozilla/firefox

if [ ! -r $volatile ]; then
	mkdir -m0700 $volatile
fi

if [ "$(readlink $link)" != "$volatile" ]; then
	mv $link $static
	ln -s $volatile $link
fi

if [ -e $link/.unpacked ]; then
	rsync -av --delete --exclude .unpacked ./$link/ ./$static/
else
	rsync -av ./$static/ ./$link/
	touch $link/.unpacked
fi
