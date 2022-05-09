import os
import time
import slack
import datetime

stat_id = str(os.uname()[1])


# Get date and time
now = datetime.datetime.now()
current_time = now.strftime('%H:%M:%S on %m/%d/%Y')

# Send a slack alert to LOCAMS alerts slack channel
slack_token = os.environ.get('SLACK_TOKEN')
client = slack.WebClient(token=slack_token)
client.chat_postMessage(channel='alert-system', text=f'This is only a test from {stat_id} at {current_time}!')