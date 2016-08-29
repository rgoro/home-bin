#!/bin/sh
gir remote prune
git branch -vv | grep ': gone' | cut -d ' ' -f 3 | xargs git branch -d

