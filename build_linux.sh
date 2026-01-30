#!/bin/bash
git pull origin main 2>/dev/null
mkdir -p build
cd build
cmake ..
make
./hello-world
