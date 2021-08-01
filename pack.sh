#!/bin/bash

git archive -o The_epic_dungeon.zip --prefix='The epic dungeon/' HEAD
cp -f The_epic_dungeon.zip ../NYRDS/common
