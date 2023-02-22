#!/bin/bash
zip -r jd6.zip * -x "build/*" -x ".git/*" -x ".gitignore*" -x ".history/*" -x "build.sh"
