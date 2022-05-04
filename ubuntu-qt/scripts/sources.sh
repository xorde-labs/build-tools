#!/bin/sh

if [ -z ${QT_VERSION+x} ]; then
  echo "QT_VERSION variable is not set. Aborting..."
  exit 1
fi

if [ -z ${QT_SOURCE_DIR+x} ]; then
  echo "QT_VERSION variable is not set. Aborting..."
  exit 1
fi

git clone https://code.qt.io/qt/qt5.git --branch="${QT_VERSION}" --depth=1 "${QT_SOURCE_DIR}"

cd "${QT_SOURCE_DIR}" || exit 2 && git submodule update --init --recursive --depth=1
