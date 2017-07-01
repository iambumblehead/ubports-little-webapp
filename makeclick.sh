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

PACKAGE_NAME=$(node -p -e "require('./package.json').name")
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")

BUILD_DIR_SRC='./src'

OUT_DIR_SRC='./platforms/click/src'
OUT_INDEX='./platforms/click'
OUT_MANIFEST='./platforms/click/manifest.json'

echo "[...] generate .click: $PACKAGE_NAME-$PACKAGE_VERSION"
echo "[...] clean sources"
mkdir -p $OUT_DIR_SRC && rm -rf $OUT_DIR_SRC/*

echo "[...] write sources"
cp -rf $BUILD_DIR_SRC/* $OUT_DIR_SRC

echo "[...] write manifest version"
sed -i "s/\"version\": \"[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\"/\"version\": \"$PACKAGE_VERSION\"/" $OUT_MANIFEST

echo "[...] write click"
click build $OUT_INDEX $OUT_INDEX
