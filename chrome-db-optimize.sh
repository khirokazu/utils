#!/bin/bash

# Vacuum and reindex sqlite databases.
# $Id$ $Date$
# Hirokazu Kobashi

FILES[0]="Cookies"
FILES[1]="Extension Web"
FILES[2]="History"
FILES[3]="History Index"
FILES[4]="Visited"
FILES[5]="Thumbnails"
FILES[6]="Archived History"
FILES[7]="Current"
FILES[8]="Last Session"
FILES[9]="Last Tab"

BASEDIR=$HOME/Library/Application\ Support/Google/Chrome

for file in ${FILES[@]}
do
	sqlite3 "$BASEDIR/$file" vacuum
	sqlite3 "$BASEDIR/$file" reindex
	hash sqlite3_analyzer
	if [ $? -eq 0 ]; then
		sqlite3_analyzer "$BASEDIR/$file" > /dev/null
	fi
done
