@echo on

:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

cmake -S . -B build -G Ninja ^
    %CMAKE_ARGS% ^
    -DCMAKE_CXX_STANDARD=20 ^
    -DBUILD_SHARED_LIBS=ON
if errorlevel 1 exit 1

:: Build.
cmake --build build --parallel %CPU_COUNT%
if errorlevel 1 exit 1

:: Install.
cmake --build build --target install
if errorlevel 1 exit 1
