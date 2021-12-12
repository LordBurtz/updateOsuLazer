#author LordBurtz

import requests
import json 
import sys
import subprocess

SCRIPT='/home/fridolin/bin/updateOsuLazer/updateOsu.sh'
url = 'https://api.github.com/repos/ppy/osu/releases/latest'

respone = json.loads(requests.get(url))

with open('current_version.xbash', 'rw') as f:
    version = file.read()

if version != response['tag_name']:
    print(subprocess.run([SCRIPT, response['tag_name']], capture_output=True))
    with open('current_version.xbash', 'w') as f:
        f.write(version)
print('osu!Lazer updated successfully')
