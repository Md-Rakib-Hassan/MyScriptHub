#!/bin/bash

recent_file_name=$(git status | grep -v 'deleted' |  grep -i 'cpp' | awk ' {print $1} ' | cut -d '.' -f 1)

for file_name in $recent_file_name; do
git add "$file_name.cpp"
git commit -m "Solved $file_name"
git push
done
