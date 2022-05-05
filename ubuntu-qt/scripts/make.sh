#!/bin/sh

if [ -z ${QT_SOURCE_DIR+x} ]; then
  echo "QT_SOURCE_DIR variable is not set. Aborting..."
  exit 1
fi

cd "${QT_SOURCE_DIR}" || exit 1

# Please refer to
# https://github.com/qt/qtbase/blob/4088b27b9397fa9877bf60b8e707bba5dc51e9cb/config_help.txt
# for configure parameters

# We don't need qtdocgallery because it produces error. More info:
# https://bugreports.qt.io/browse/QTBUG-82690

./configure -opensource -release -confirm-license \
  -nomake examples -nomake tests -skip qtdocgallery

make -j4

make install
