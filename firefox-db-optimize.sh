#!/bin/bash

# Vacuum and reindex sqlite databases.
# $Id$ $Date$
# Hirokazu Kobashi

find $HOME/Library/Application\ Support/Firefox/Profiles -type f -name '*.sqlite' | xargs -I{} sqlite3 {} vacuum
find $HOME/Library/Application\ Support/Firefox/Profiles -type f -name '*.sqlite' | xargs -I{} sqlite3 {} reindex

hash sqlite3_analyzer
if [ $? -eq 0 ]; then
    find $HOME/Library/Application\ Support/Firefox/Profiles -type f -name '*.sqlite' | xargs -I{} sqlite3_analyzer {} > /dev/null
fi
