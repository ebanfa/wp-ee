#!/bin/bash

# ssh 568431577628e1f9cf0000f1@helion-ishadowbanker.rhcloud.com
git config --global user.email "ebanfa@gmail.com"

git config --global user.name "Edward Banfa"

git remote set-url origin git@github.com:ebanfa/wp-ee.git

git add .

git status

git commit -m "Shadow Origin Maxim Gorky"

git push -u origin master
