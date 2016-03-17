#!/bin/sh

mkdir -p ~/.fonts || exit 1

TEMP_DIR=$(mktemp -d)
TEMP_FILE=$(mktemp)
trap "rm -rf $TEMP_DIR $TEMP_FILE" EXIT

BASE_URL=http://www.paratype.ru/uni/public
for FONT in Sans Serif Mono; do
    curl $BASE_URL/PT$FONT.zip -o $TEMP_FILE || exit 1
    unzip -n -x $TEMP_FILE -d $TEMP_DIR || exit 1
done

cp $TEMP_DIR/*.ttf ~/.fonts || exit 1
