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

WEB_SRC=./src
CLICK_DIR=./platforms/click
CLICK_SRC=$CLICK_DIR/src
CLICK_MANIFEST=$CLICK_DIR/manifest.json

NAME=`node -p -e 'require("./package.json").name'`
VERSION=`node -p -e 'require("./package.json").version'`

echo '[...] generate .click: $NAME-$VERSION'
echo '[...] clean sources'
mkdir -p $CLICK_SRC && rm -rf $CLICK_SRC/*

echo '[...] write sources'
cp -rf $WEB_SRC/* $CLICK_SRC

echo '[...] write manifest version'
sed -i 's/\("version": "\)[0-9]*.[0-9]*.[0-9]*/\1'$VERSION'/' $CLICK_MANIFEST

echo '[...] write click'
click build $CLICK_DIR
