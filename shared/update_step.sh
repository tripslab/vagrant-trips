#!/bin/bash

cd step
rm src
mv TRIPS src
git pull
mv src TRIPS
ln -s TRIPS src
