#!/bin/bash

set -ex

python --version

pip install -U conan html5lib
conan profile detect
echo "tools.cmake.cmaketoolchain:generator=Ninja" >> ~/.conan2/global.conf
sed -i 's/compiler.cppstd=14/compiler.cppstd=20/' ~/.conan2/profiles/default

conan install --build=missing . -of __dist

# conan create \
#     --build=missing \
#     --version=6.8.3 \
#     -o "qt/*:qtactiveqt"=True \
#     -o "qt/*:qt5compat"=True \
#     -o "qt/*:qtconnectivity"=True \
#     -o "qt/*:qtdeclarative"=True \
#     -o "qt/*:qtimageformats"=True \
#     -o "qt/*:qtlocation"=True \
#     -o "qt/*:qtmultimedia"=True \
#     -o "qt/*:qtscxml"=True \
#     -o "qt/*:qtsensors"=True \
#     -o "qt/*:qtserialbus"=True \
#     -o "qt/*:qtserialport"=True \
#     -o "qt/*:qtshadertools"=True \
#     -o "qt/*:qtspeech"=True \
#     -o "qt/*:qtsvg"=True \
#     -o "qt/*:qttools"=True \
#     -o "qt/*:qttranslations"=True \
#     -o "qt/*:qtwebchannel"=True \
#     -o "qt/*:qtwebengine"=True \
#     -o "qt/*:qtwebsockets"=True \
#     -o "qt/*:qtwebview"=True \
#     -o "qt/*:shared"=True \
#     ./recipes/qt/6.x.x
#
