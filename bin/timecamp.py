#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import requests
import sqlite3
from datetime import datetime
from urllib.parse import urlparse

configfile = '/home/brian/.config/tctimestamp'

# Load state
with open(configfile, 'r') as f:
    config = json.load(f)

# Read history
db = sqlite3.connect('/home/brian/.config/qutebrowser/history.sqlite')
c = db.cursor()
c.execute('SELECT atime, url FROM History WHERE atime>?',
          (config['lastprocessed'], ))
history = c.fetchall()
db.close()

if len(history) == 0:
    print("No history to report")
    exit()

post = {'api_token': config['apikey'], 'computer_activities': []}
for row in history:
    start = datetime.fromtimestamp(row[0]).strftime('%Y-%m-%d %H:%M:%S')
    end = datetime.fromtimestamp(row[0] + 1).strftime('%Y-%m-%d %H:%M:%S')
    url = urlparse(row[1])
    post['computer_activities'].append({
        'application_name': 'Internet',
        'start_time': start,
        'end_time': end,
        'website_domain': url.hostname
    })

# Upload history
r = requests.post(
    'https://www.timecamp.com/third_party/api/activity', json=post)

# Save state on success
if r.status_code == 200:
    print('Reported {} activities'.format(len(history)))
    config['lastprocessed'] = history[-1][0]
    with open(configfile, 'w') as f:
        json.dump(config, f)
else:
    print('Failed to report {} activities'.format(len(history)))
