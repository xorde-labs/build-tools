#!/bin/sh

if [ -z ${QT_SOURCE_DIR+x} ]; then
  echo "QT_VERSION variable is not set. Aborting..."
  exit 1
fi

cd "${QT_SOURCE_DIR}" || exit 1

# Enable c++ 11 mode for g++

#alias g++="g++ --std=c++0x"

# Please refer to
# https://github.com/qt/qtbase/blob/4088b27b9397fa9877bf60b8e707bba5dc51e9cb/config_help.txt
# for configure parameters

#./configure -c++std 17 -platform linux-g++ -opensource -confirm-license -nomake examples -nomake tests
./configure -opensource -confirm-license -nomake examples -nomake tests

make -j4
