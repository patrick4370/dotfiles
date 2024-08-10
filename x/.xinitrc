#!/bin/bash

# [ -f ~/.xprofile ] && . ~/.xprofile

# systemctl --user import-environment DISPLAY

# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#   [ -x "$f" ] && . "$f"
#  done
#  unset f
# fi

xset s 0 0
# xset +dpms dpms 900 900 900
# 
exec i3
