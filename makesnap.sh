#!/bin/bash
#
# I've never succesfully generated a working snap file :S
#
# I've followed various guides and installed overlays and
# linked various libraries. Maybe in the future I will find
# a way to generate an html snap...
#
#
# https://tutorials.ubuntu.com/tutorial/snap-a-website#1
#
# $ sudo add-apt-repository ppa:ci-train-ppa-service/stable-phone-overlay 
# $ sudo apt update
# $ sudo apt upgrade
#
# needed for qt5 lib .so file not found...
#
# https://github.com/ubuntu/snapcraft-desktop-helpers/issues/62
#
# snap packages are installed here: /snap/bin

PACKAGE_NAME=$(node -p -e "require('./package.json').name")
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")

BUILD_DIR_SRC='./src'

OUT_DIR_SRC='./platforms/snap/src'
OUT_INDEX='./platforms/snap'
OUT_MANIFEST='./platforms/snap/snapcraft.yaml'

echo "[...] generate .snap: $PACKAGE_NAME-$PACKAGE_VERSION"
echo "[...] clean sources"
mkdir -p $OUT_DIR_SRC && rm -rf $OUT_DIR_SRC/*

echo "[...] write sources"
cp -rf $BUILD_DIR_SRC/* $OUT_DIR_SRC

echo "[...] write manifest version"
sed -i "s/version: \"[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\"/version: \"$PACKAGE_VERSION\"/" $OUT_MANIFEST

echo "[...] write snap"
# $ snapcraft stage
# $ sudo snap install --dangerous ubports-little-webapp_1.0.0_amd64.snap
# $ snap list
# $ ubports-little-webapp 
# $ sudo snap remove ubports-little-webapp
