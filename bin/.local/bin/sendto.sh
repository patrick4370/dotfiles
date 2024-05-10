#!/usr/bin/env bash
#
#===============================================================================
#
#          FILE: sendto.sh 
#
#         USAGE: Used as a custom action with Thunar file browser 
#
#   DESCRIPTION: This is a custom action in Thunar. Parameters are as follows
#                Name: Send to Email
#                Command: 
#                
#
#  REQUIREMENTS: 
#        AUTHOR: Patrick Heffernan (PH), patrick4370@bigpond.com
#       CREATED: 20-04-2024 11:24 +1000 
#
#===============================================================================

# Best practice for BASH scripts
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# Assign command line arguments from thunar to an array
fileattachments=("${@}")

# Loop through the array and append a comma on each item and assign to a variable
for item in "${fileattachments[@]}"; do
    result+="$item,"
done

# Remove the trailing comma
result="${result%,}"

# Compose the email with attachments
betterbird -compose "attachment='${result}'"
