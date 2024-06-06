#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 02/June/2024 - 13:51
# Purpose: Play video from Youtube URL
#
set -euo pipefail

player='/usr/bin/mpv'

URL=$(yad --entry --entry-label=" Enter YouTube URL " --width=500 --fixed)

"$player" "$URL"
