#!/bin/sh

find ${1} -type f -name '*.sqlite*' | xargs  -I {} sqlite3 {} vacuum
