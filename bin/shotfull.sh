#!/bin/bash

DIRECTORY="$HOME/Pictures"
FILENAME=$(date +"%d%m%Y%H%M%S%N").png

hyprshot -m output -o $DIRECTORY -f $FILENAME

sleep 1
swappy -f "$DIRECTORY/$FILENAME"
