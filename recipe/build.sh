#!/bin/sh

mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -G "Ninja" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_SHARED_LINKER_FLAGS="${CMAKE_SHARED_LINKER_FLAGS} -pthread" \
      -DCMAKE_EXE_LINKER_FLAGS="${CMAKE_EXE_LINKER_FLAGS} -pthread" \
      -DBUILD_SHARED_LIBS=ON \
      -DPostgreSQL_ROOT=$PREFIX \
      -DPostgreSQL_LIBRARY=$PREFIX/lib/libpq${SHLIB_EXT} \
      -DPostgreSQL_INCLUDE_DIR=$PREFIX/include

cmake --build . --config Release
cmake --build . --config Release --target install
