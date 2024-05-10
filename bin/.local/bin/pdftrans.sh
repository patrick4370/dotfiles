#!/usr/bin/env bash
#===============================================================================
#
#          FILE: pdftrans.sh
#
#         USAGE: ./pdftrans.sh
#
#   DESCRIPTION: 
#
#       OPTIONS:  
#  REQUIREMENTS:  
#        AUTHOR: Patrick Heffernan <patrick4370@bigpond.com>
#       CREATED: 10/11/22 16:53
#===============================================================================

# set -o nounset        # Treat unset variables as an error
#!/usr/bin/env bash
if [ $# -ne 1 ] ; then
    echo "Use: $0 pdf_with_background.pdf"
    exit 1
fi

FILE="$1"
FILEQDF="$1.readable.pdf"
FILETMP="$1.tempfile.pdf"

# backups
#cp "$FILE" "$FILE.BAK"
# converts to readable format
qpdf -qdf "$FILE" "$FILEQDF"
# removes background
cat "$FILEQDF" | sed  '/^%% Contents for page/, /f\*/ { /^1 1 1 rg/, /f\*/ { s/^/%% /  }  }' >  "$FILETMP"
# fixes pdf
fix-qdf "$FILETMP" > "$FILE"
rm "$FILETMP"
rm "$FILEQDF"
