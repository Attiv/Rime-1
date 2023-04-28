#!/bin/bash

# create the zip file
zip -r jd6.zip . -x "build/*" -x ".git/*" -x ".gitignore*" -x ".history/*" -x "build.sh"

# move xmjd6enre.reverse.bin to build folder
mv build/xmjd6enre.reverse.bin build/

# add xmjd6enre.reverse.bin to the existing zip file
zip -ur jd6.zip build/xmjd6enre.reverse.bin
