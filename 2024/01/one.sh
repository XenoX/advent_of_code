#!/usr/bin/env bash

LEFT=$(awk '{print $1}' < ./data | sort )
RIGHT=$(awk '{print $2}' < ./data | sort )
# echo "$LEFT"
# echo "$RIGHT"

LINES=$(paste -d '-' <(echo "${RIGHT}") <(echo "${LEFT}") | bc | sed 's/-//')
# echo "$LINES"

TOTAL=$(paste -sd '+' <(echo "$LINES") | bc) 
echo "$TOTAL"
