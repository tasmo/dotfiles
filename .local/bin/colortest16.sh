#!/usr/bin/env bash

#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#

T='o0O'   # The test text

COLORARRAY="40m 100m  47m 107m  41m 101m  42m 102m  \
43m 103m  44m 104m  45m 105m  46m 106m"

echo -e "\n            $COLORARRAY"

for FGs in '    m' '   1m' \
    '  30m' '1;30m' '  90m' '1;90m' \
    '  31m' '1;31m' '  91m' '1;91m' \
    '  32m' '1;32m' '  92m' '1;92m' \
    '  33m' '1;33m' '  93m' '1;93m' \
    '  34m' '1;34m' '  94m' '1;94m' \
    '  35m' '1;35m' '  95m' '1;95m' \
    '  36m' '1;36m' '  96m' '1;96m' \
    '  37m' '1;37m' '  97m' '1;97m';
do FG=${FGs// /}
    echo -en "$FGs \033[$FG $T "
    for BG in $COLORARRAY;
    do echo -en "$EINS\033[$FG\033[$BG $T \033[0m";
    done
    echo
done
