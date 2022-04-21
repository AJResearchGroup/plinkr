#!/bin/bash

rm -rf build

mkdir build

cp -r ../R build
cp -r ../inst build
cp -r ../man build
cp -r ../vignettes build
cp ../DESCRIPTION build
cp ../NAMESPACE build

# Use exit in case 'cd' fails
cd build || exit

R CMD build .

# Use ./*glob* or -- *glob* so names with dashes won't become options
R CMD check --as-cran "$(ls -- *.tar.gz)"
