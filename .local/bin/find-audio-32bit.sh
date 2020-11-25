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

# Distinguish between 16bit and 32bit
if [ -f "$statsdir/flac" ]; then
    input="$statsdir/flac"
    while IFS= read -r line; do
        filename=${line#* }
        if avprobe "$filename" 2>&1 | grep -q 's16'; then
            echo "$line" >> "$statsdir/flac_s16"
        else
            echo "$line" >> "$statsdir/flac_s32"
        fi
    done < "$input"
    #rm "$statsdir/m4a"
fi

# Generate and display result
{
    printf "Type Count Size\n"
    for extension in $(ls "$statsdir"); do
        count=$(wc -l "$statsdir/$extension" | cut -d ' ' -f 1)
        totalsize=$(awk '{s+=$1} END {print s}' "$statsdir/$extension")
        printf "%s %d %d\n" "$extension" "$count" "$totalsize"
    done
} | column -t
