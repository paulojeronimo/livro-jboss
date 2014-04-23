#!/bin/bash
# Author: Paulo Jerônimo (@paulojeronimo, pj@paulojeronimo.info)
basedir=`d=$(dirname "$0"); cd "$d"; echo -n $PWD`
op=${1:-build}

__asciidoc() {
   local f=$1
   local cmd="asciidoc $f"

   echo "$cmd"; $cmd
}

_build() {
   find . -type f -name "*.asciidoc" ! -path 'slides/*' | \
   while read f
   do 
      h=${f/asciidoc/html}
      [ ! -f "$h" ] && __asciidoc "$f"
      [ "$f" -nt "$h" ] && __asciidoc "$f"
   done
}

_delete() {
   find . -type f -name "*.html" -delete
}

cd "$basedir"
_$op
