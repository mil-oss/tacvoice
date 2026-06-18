#!/bin/bash
set -e

PROJECT_ROOT="/mnt/HARDONE/NSI_Repos/tacvoice"
XSLT="${PROJECT_ROOT}/lib/xml/xsl/MakeMsgForms.xsl"
MESSAGES="${PROJECT_ROOT}/lib/xml/inst/Messages.xml"
OUTPUT_DIR="${PROJECT_ROOT}/lib/msgs"

MSGS=(
    "BLUE 1" "BLUE 2" "BLUE 3" "BLUE 4" "BLUE 5" "BLUE 6"
    "RED 1" "RED 2" "RED 3" "RED 4" "RED 5" "RED 6"
    "GREEN 1" "GREEN 2" "GREEN 3" "GREEN 4" "GREEN 5" "GREEN 6"
    "GREEN 7" "GREEN 8" "GREEN 9" "GREEN 10" "GREEN 11" "GREEN 12"
    "GREEN 13" "GREEN 14" "GREEN 15" "GREEN 16"
    "YELLOW 1" "" "YELLOW 2" "YELLOW 3" "YELLOW 4" "YELLOW 5" "YELLOW 6"
    "WHITE 1" "WHITE 2" "WHITE 3" "WHITE 4" "WHITE 5"
    "GRAY 1" "GRAY 4"
)

mkdir -p "$OUTPUT_DIR"

xsltproc --stringparam MSGNO "TOC" "$XSLT" "$MESSAGES" > "$OUTPUT_DIR/TacMessageTOC.html"

for msg in "${MSGS[@]}"; do
    xsltproc --stringparam MSGNO "$msg" "$XSLT" "$MESSAGES" > "$OUTPUT_DIR/${msg}.html"
done
