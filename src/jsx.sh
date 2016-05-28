#!/bin/bash

cd ./assets/react/

babel --presets react -w './src' -d './build'

# babel --presets es2015 --presets react -w './src' -d './build' \
# & babel --presets es2015 -w './.tmp' -d './build'