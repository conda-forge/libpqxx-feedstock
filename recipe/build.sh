#!/bin/sh

mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -G "Ninja" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_EXE_LINKER_FLAGS="-pthread" \
      -DBUILD_SHARED_LIBS=ON

cmake --build . --config Release
cmake --build . --config Release --target install
