#!/usr/bin/env bash
#===============================================================================
#
#          FILE: siggen.sh
#
#         USAGE: ./siggen.sh
#
#   DESCRIPTION: Run from a systemd timer, will generate a signature file with 
#                quote for an email signature. Randomly selects a new box style 
#                on each run. Saves the signature file in the $HOME directory.
#
#        AUTHOR: Patrick Heffernan (PH), pheffernan4370@gmail.com
#       CREATED: 18/07/20 16:48:29
#===============================================================================

#-------------------------------------------------------------------------------
# Remove old signature file before proceeding
#-------------------------------------------------------------------------------

rm ~/.signature

#-------------------------------------------------------------------------------
# Define variables for the signature generator 
#-------------------------------------------------------------------------------
name="Patrick Heffernan\n\n"
quote_file=~/.local/bin/quotes.txt
quote=$(shuf -n 1 $quote_file)    # Randomly choose one line from the quote file
signature=$name$quote

#-------------------------------------------------------------------------------
# Create an array of box styles and select a random style
#-------------------------------------------------------------------------------

array_style=("ada-box" "peek" "shell" "simple" "stone" "vim-box" "whirly")
style=$(shuf -e "${array_style[@]}" -n1)

#-------------------------------------------------------------------------------
# Generate the box and fill with the signature
#-------------------------------------------------------------------------------

echo -e "$signature" | boxes -d "$style" -ajc -p h2 > ~/.signature
