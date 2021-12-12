#!/bin/bash

GAME_DIR="/home/$USER/Games"

DESK_ENTR_URL="https://raw.githubusercontent.com/LordBurtz/updateOsuLazer/master/osu.desktop"

#cleaning dir
find -type f -name '*osu*' -delete || echo " "

#getting latest osu passed in by version
wget --output-document "osu-$1.AppImage" "https://github.com/ppy/osu/releases/download/$1/osu.AppImage"
chmod a+x "osu-$1.AppImage"
find $GAME_DIR -type f -name '*osu*AppImage*' -delete  || echo "first install init"
mv "osu-$1.AppImage" $GAME_DIR

#updating desktop entry
deskEntryDir="/home/$USER/.local/share/applications"
if [[ -f "$deskEntryDir/osu.desktop" ]]; then
	sed -i "s/osu.*AppImage/osu-$1.AppImage/g" "$deskEntryDir/osu"*".desktop"
else
	wget --output-document "$deskEntryDir/osu.desktop" $DESK_ENTR_URL
fi
