#!/bin/bash
#
# to install:
#
# $ adb push myclick_1.0.0_all.click /tmp
# $ adb shell
# $ pkcon install-local --allow-untrusted /tmp/myclick_1.0.0_all.click
#
# http://popey.com/blog/2015/07/28/easily-port-mobile-html5-games-to-ubuntu-phone/
# http://www.linuxuk.org/post/20160518_snapping_electron_based_applications_simplenote/

NAME=$(node -p -e 'require("./package.json").name')
VERSION=$(node -p -e 'require("./package.json").version')

WEB_SRC=./src
CLICK_SRC=./platforms/click/src

INDEX=./platforms/click
MANIFEST=./platforms/click/manifest.json

echo '[...] generate .click: $NAME-$VERSION'
echo '[...] clean sources'
mkdir -p $CLICK_SRC && rm -rf $CLICK_SRC/*

echo '[...] write sources'
cp -rf $WEB_SRC/* $CLICK_SRC

echo '[...] write manifest version'
sed -i 's/\("version": "\)[0-9]*.[0-9]*.[0-9]*/\1'$VERSION'/' $MANIFEST

echo '[...] write click'
click build $INDEX $INDEX
