#!/bin/sh

mkdir -p ~/.fonts || exit 1

TEMP_DIR=$(mktemp -d)
TEMP_FILE=$(mktemp)
trap "rm -rf $TEMP_DIR $TEMP_FILE" EXIT

curl -v -H 'Referer: https://www.paratype.ru/collections/pt/44157' \
     -o $TEMP_FILE 'https://api.paratype.com/api/editions/ofl/download/59384' || exit 1
unzip -x $TEMP_FILE -d $TEMP_DIR || exit 1
find $TEMP_DIR -name \*.ttf -exec mv {} ~/.fonts \; || exit 1
