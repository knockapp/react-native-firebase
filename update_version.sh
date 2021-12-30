#!/bin/zsh

git fetch
git checkout main
git pull --rebase package main
cd packages/messaging && yarn build
cd -
git tag -f v`python -c "import json; f = open('lerna.json'); j = json.load(f); print(j['version'])"`
git commit --amend --no-edit
git push --tags -f
git push -f
