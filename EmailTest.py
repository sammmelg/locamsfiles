import smtplib
import ssl
import datetime
from email.mime.text import MIMEText
import os
import glob
import RMS.ConfigReader as cr
from RMS.CaptureDuration import captureDuration
import os
import time

now = datetime.datetime.now()
current_time = now.strftime('%H:%M:%S on %m/%d/%Y')

# Send an email from uname: locams.alert@gmail.com
email_token = os.environ.get('EMAIL_TOKEN')
port = 465  # For SSL
smtp_server = 'smtp.gmail.com'
sender_email = 'locams.alert@gmail.com'  # Enter your address
receiver_email = 'shemmelgarn@lowell.edu'  # Enter receiver address
password = email_token

msg = MIMEText(f'The camera {stat_id} is testing itself at {current_time}')

msg['Subject'] = 'Camera Fail'
msg['From'] = 'LOCAMS Alert'
msg['To'] = 'shemmelgarn@lowell.edu'

context = ssl.create_default_context()

with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, msg.as_string())