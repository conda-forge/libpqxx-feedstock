@echo on

:: Activate the vc143 (VS2022) environment
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64 -vcvars_ver=14.3

:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

cmake -S . -B build -G "Ninja" ^
    %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON
if errorlevel 1 exit 1

:: Build.
cmake --build build --parallel %CPU_COUNT%
if errorlevel 1 exit 1

:: Install.
cmake --build build --target install
if errorlevel 1 exit 1
