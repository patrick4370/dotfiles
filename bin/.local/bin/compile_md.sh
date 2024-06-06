#!/usr/bin/env bash
#
#  Author: Patrick Heffernan <patrick4370@bigpond.com>
#    Date: 01/June/2024 - 13:04
# Purpose: Converts markdown *.md files to html *.html files
#
set -euo pipefail

current_dir=$(readlink -f .)
target_dir="/home/patrick/Documents/Vimwiki_md"
target_html="/home/patrick/Documents/github_html/patrick4370.github.io"

if [[ "${current_dir}" != "${target_dir}" ]]; then
    pushd "$target_dir" &>/dev/null
fi

echo -e "\nReady to compile markdown files in: $target_dir\n"

for f in *.md; do 
    echo "Converting $f to ${f%.md}".html 
    pandoc -s -f markdown -t html "$f" \
    -o "${target_html}"/"${f%.md}".html \
    --template=GitHub.html5 --lua-filter="${target_dir}"/filters/links-to-html.lua \
    --extract-media="${target_html}" 
done

unset DIRSTACK
