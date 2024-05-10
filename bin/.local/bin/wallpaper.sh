#!/usr/bin/env bash
#===============================================================================
#
#          FILE: wallpaper.sh
#
#         USAGE: ./wallpaper.sh
#
#   DESCRIPTION: Changes wallpaper every N minutes
#                adjust crontab for your personal
#                preference for time.
#                crontab settings */5 * * * * ~/bin/wallpaper.sh
#
#                --randomize - When viewing multiple files in a slideshow, 
#                              randomize the file list before displaying.  
#                              The list is re-randomized whenever the slideshow 
#                              cycles (that is, transitions from last to first image).
#
#                --bg-scale -  preserves aspect ratio by zooming the image until it fits.  
#                              Either a horizontal or a vertical part of the image will before
#                              cut off
#
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#       CREATED: 26/07/20 14:43:09
#===============================================================================

export DISPLAY=:0.0
feh --bg-fill --randomize ~/Pictures/wallpapers/
