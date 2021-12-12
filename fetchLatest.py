#author LordBurtz

import requests
import json 
import sys

url = 'https://api.github.com/repos/ppy/osu/releases/latest'

respone = json.loads(requests.get(url))

with open('current_version.xbash', 'rw') as f:
    version = file.read()

if version != response['tag_name']:

