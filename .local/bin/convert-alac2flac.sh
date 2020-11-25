#!/usr/bin/env sh

# This script takes the searched directory as first parameter.
# For instance: ./this-script.sh ~/Music

: ${1:?"You must pass the search directory as first parameter."}
searchdir="$1"

# Create a temporary directory
statsdir=""
trap 'rm -rf $statsdir' EXIT
statsdir=$(mktemp -d "$HOME/tmp/tmp.XXXXXXXXXX") || exit 1

# Generate one listing file per extension
awkscript='/\.[[:alnum:]]+$/ {print $0 >statsdir"/"$(NF)}'
# For Linux: stat -c "%s %n"
# For Mac: stat -f "%z %N"
find "$searchdir" -type f -exec stat -c "%s %n" {} + | \
    awk -F '.' -v statsdir="$statsdir" "$awkscript"

# Distinguish between m4a/AAC and m4a/ALAC
if [ -f "$statsdir/m4a" ] ; then
    input="$statsdir/m4a"
    while IFS= read -r line ; do
        filename=${line#* }
        if avprobe "$filename" 2>&1 | grep -q 'Audio: alac' ; then
            for f in $filename ; do
                echo "$filename"
                avconv -i "$f" -c:v copy -c:a flac -sample_fmt s16 -ar 44100 "${f%.m4a}.flac" -y -v error && rm -f "$f"
            done
        fi
    done < "$input"
    rm "$statsdir/m4a"
fi
