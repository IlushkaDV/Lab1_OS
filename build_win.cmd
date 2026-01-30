@echo off
git pull origin main
if not exist build mkdir build
cd build
cmake .. -G "MinGW Makefiles"
cmake --build .
hello-world.exe
pause