#!/bin/sh

set -e

out="site/main.js"

size=$(cat $out | wc -c)
echo "Compiled size:   $((size / 1000))k"

uglifyjs $out --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=$out

size=$(cat $out | wc -c)
echo "Compressed size: $((size / 1000))k"
size=$(cat $out | gzip -c | wc -c)
echo "Gzipped size:    $((size / 1000))k"
