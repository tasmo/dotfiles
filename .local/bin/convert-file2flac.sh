#!/usr/bin/env sh

# This script takes the searched directory as first parameter.
# For instance: ./this-script.sh ~/Music

: ${1:?"You must pass the search directory as first parameter."}
filename="$1"

for f in $filename ; do
    echo "$filename"
    avconv -i "$f" -c:v copy -c:a flac -sample_fmt s16 -ar 44100 "${f%....}.flac" -y -v error
done
