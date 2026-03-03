#!/bin/sh
set exo pipefail

if [[ "${target_platform}" == "linux-"* ]]; then
  EXTRA_LINKER_FLAGS="-pthread -Wl,-rpath-link,$PREFIX/lib"
elif [[ "${target_platform}" == "osx-"* ]]; then
  EXTRA_LINKER_FLAGS="-pthread"
fi

cmake -S . -B build -G "Ninja" \
      ${CMAKE_ARGS} \
      -DCMAKE_SHARED_LINKER_FLAGS="${CMAKE_SHARED_LINKER_FLAGS} ${EXTRA_LINKER_FLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS="${CMAKE_EXE_LINKER_FLAGS} ${EXTRA_LINKER_FLAGS}" \
      -DBUILD_SHARED_LIBS=ON

cmake --build build --parallel ${CPU_COUNT}
cmake --build build --target install
