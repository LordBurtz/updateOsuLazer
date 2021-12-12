#author LordBurtz

import requests
import json 
import sys
import subprocess

SCRIPT='~/bin/updateOsuLazer/updateOsu.sh'
url = 'https://api.github.com/repos/ppy/osu/releases/latest'

response = requests.get(url)

json_data = response.json() if response and response.status_code == 200 else sys.exit('Internet connection be misbehaving')

with open('current_version.xbash', 'r') as file:
    version = file.read()

if version != json_data['tag_name']:
    print(subprocess.run([SCRIPT, json_data['tag_name']], capture_output=True))
    with open('current_version.xbash', 'w') as f:
        f.write(version)
print('osu!Lazer updated successfully')
