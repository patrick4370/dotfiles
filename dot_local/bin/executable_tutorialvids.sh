#!/usr/bin/env sh
vidlist="
sed     https://www.youtube.com/watch?v=QaGhpqRll_k
regex   https://www.youtube.com/watch?v=77I4ZkhuHsQ
"
echo "$vidlist" | grep -P "^$(echo "$vidlist" | grep "https:" | sed 's/\t.*//g' | rofi -dmenu -i -p "Learn about what? (ESC to cancel)" -l 20 | awk '{print $2}')\s" | sed 's/.*\t//' | xargs -r mpv
