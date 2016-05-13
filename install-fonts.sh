#!/bin/sh

mkdir -p ~/.fonts || exit 1

TEMP_FILE=$(mktemp)
trap "rm -rf $TEMP_FILE" EXIT

BASE_URL=http://www.paratype.ru/uni/public
for FONT in Sans Serif Mono; do
    curl $BASE_URL/PT$FONT.zip -o $TEMP_FILE || exit 1
    unzip -n -x $TEMP_FILE -d ~/.fonts '*.ttf' || exit 1
done
