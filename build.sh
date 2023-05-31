#!/bin/bash

file="jd6.zip"

if [ -f "$file" ]; then
    echo "Deleting $file..."
    rm "$file"
    echo "$file deleted."
else
    echo "$file not found."
fi

# create the zip file
zip -r jd6.zip . -x "build/*" -x ".git/*" -x ".gitignore*" -x ".history/*" -x "build.sh" -x "词库转换键道-兰.zip" -x "qui.py"

# move xmjd6enre.reverse.bin to build folder
mv build/xmjd6enre.reverse.bin build/

# add xmjd6enre.reverse.bin to the existing zip file
zip -ur jd6.zip build/xmjd6enre.reverse.bin
