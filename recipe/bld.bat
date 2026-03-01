@echo on

:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

:: Activate the vc143 (VS2022) environment
cmake -S . -B build -T v143 ^
    %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON
if errorlevel 1 exit 1

:: Build.
cmake --build build --parallel %CPU_COUNT%
if errorlevel 1 exit 1

:: Install.
cmake --build build --target install
if errorlevel 1 exit 1
