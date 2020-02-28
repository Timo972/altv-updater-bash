#!/bin/bash

BASEDIR=$(dirname $0)
export LD_LIBRARY_PATH=${BASEDIR}

BRANCH=release
ARCH=x64_linux

wget "https://cdn.altv.mp/server/$BRANCH/$ARCH/altv-server" -O ./altv-server
wget "https://cdn.altv.mp/node-module/$BRANCH/$ARCH/libnode.so.72" -O ./libnode.so.72

cd modules/
wget "https://cdn.altv.mp/node-module/$BRANCH/$ARCH/modules/libnode-module.so" -O ./libnode-module.so

cd ../
cd data/
wget "https://cdn.altv.mp/server/$BRANCH/$ARCH/data/vehmodels.bin" -O ./vehmodels.bin
wget "https://cdn.altv.mp/server/$BRANCH/$ARCH/data/vehmods.bin" -O ./vehmods.bin

cd ../
wget "https://cdn.altv.mp/server/$BRANCH/$ARCH/update.json" -O ./update.json
echo 'Updated! now starting . . .';
chmod +x altv-server
./altv-server
