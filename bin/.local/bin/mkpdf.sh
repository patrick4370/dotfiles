#!/usr/bin/env bash
#===============================================================================
#
#          FILE: mkpdf.sh
#
#         USAGE: ./mkpdf.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 06/11/22 15:16
#===============================================================================

# set -o nounset        # Treat unset variables as an error

pandoc document.md \
    -o document.pdf \
    --template eisvogel.tex \
    --listings \
    
