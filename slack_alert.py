import slack
import os

slack_token = os.environ.get('SLACK_TOKEN')
client = slack.WebClient(token=slack_token)
client.chat_postMessage(channel='alert-system', text='This is only a test')