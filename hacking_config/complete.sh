#!/bin/bash

p = $PWD

mv $PWD "${PWD}_COMPLETE"
cd ..

git add .
git commit -m "$(echo $p | rev | cut -d "/" -f 1 | tail -n1 | rev)"
git push

