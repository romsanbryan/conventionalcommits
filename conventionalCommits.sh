#!/bin/bash

TYPE=0

echo "
    [1] feat: A new feature
    [2] fix: A bug fix
    [3] perf: A code change that improves performance
    [4] chore: Build process or auxiliary tool changes
    [5] ci: CI related changes
    [6] docs: Documentation only changes
    [7] refactor: A code change that neither fixes a bug or adds a feature
    [8] style: Markup, white-space, formatting, missing semi-colons...
    [9] test: Adding missing tests
    [10] release: Create a release commit
    "


read -p "Type of change: " n
case $n in
        1) TYPE=feat;;
        2) TYPE=fix;;
        3) TYPE=perf;; 
        4) TYPE=chore;;
        5) TYPE=ci;;
        6) TYPE=docs;;
        7) TYPE=refactor;;
        8) TYPE=style;;
        9) TYPE=test;;
        10) TYPE=release;;
esac


read -p "What's affect?: " n
COMPONENT=$n
 
read -p "Short description: " n
MSG=$n

MSGCOMMIT="${TYPE}"

[ ! -z "$COMPONENT" ]  &&  MSGCOMMIT="${MSGCOMMIT}(${COMPONENT})"

MSGCOMMIT="${MSGCOMMIT}: ${MSG}"

git commit -m ${MSGCOMMIT}
echo "\n ------------- \n"
