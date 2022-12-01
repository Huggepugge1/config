#!/bin/bash

git add ..
git commit -m "$(echo $PWD | rev | cut -d "/" -f 1 | tail -n1 | rev)"
git push

mv $PWD "${PWD}_COMPLETE"
cd ..
