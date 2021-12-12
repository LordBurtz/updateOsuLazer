#!/bin/bash

GAME_DIR="/home/$USER/Games"

#cleaning dir
find -type f -name '*osu*' -delete || echo " "

#getting latest osu passed in by version
wget --output-document "osu-$1.AppImage" "https://github.com/ppy/osu/releases/download/$1/osu.AppImage"
chmod a+x "osu-$1.AppImage"
find $GAME_DIR -type f -name '*osu*AppImage*' -delete  || echo "first install init"
mv "osu-$1.AppImage" $GAME_DIR

#updating desktop entry
deskEntryDir="/home/$USER/.loal/share/appliactions"


