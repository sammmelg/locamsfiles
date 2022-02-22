import smtplib
import ssl
import datetime
from email.mime.text import MIMEText
import os
import glob

# Insert following text into crontab to automate runnning on the pi at 7pm nightly.  Script must be in
# /home/pi/source/RMS/Utils directory:
# SHELL=/bin/sh
# PATH=/home/pi/vRMS/bin:/usr/local/Qt-5.15.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# 00 19 * * * cd /home/pi/source/RMS/Utils && python3.7 TestDeviceOpen.py

stat_id = str(os.uname()[1])

def main():
    # Get the current log
    file = get_current_log()[0]

    # Read the log to see if the camera opened, if camera not opened for capture then camera status = False
    camera_status = read_log(file)

    # If the camera is not open, send an email
    if camera_status == False:
        send_email()


def get_current_log():
    # Go to the log directory
    os.chdir('/home/pi/RMS_data/logs')

    # Find the most current log file based on the string 'log_*stationID*_*todaysYYYYMMDD*_******WILDCARD******.log
    # Initialize the log string variable
    date = datetime.datetime.today().strftime('%Y%m%d')
    log_search = 'log_' + stat_id + '_' + date + '_*************.log'

    # Search for that file in the directory
    log = glob.glob(log_search)

    # Return that file to be read
    return log


def read_log(infile):
    # Open and read the log file
    with open(infile, 'r') as log_file:
        for line in log_file:

            # if anywhere in the file reads 'The video source could not be opened!', return False
            if 'The video source could not be opened!' in line:
                return False

    # If log does not read 'The video source could not be opened!', return True
    print('"The video source could not be opened!" was not found in the log file.')
    return True


def send_email():
    # Get date and time
    now = datetime.datetime.now()
    current_time = now.strftime('%m/%d/%Y %H:%M:%S')

    # Send an email from uname: locams.alert@gmail.com pass: low311Camer4$
    port = 465  # For SSL
    smtp_server = 'smtp.gmail.com'
    sender_email = 'locams.alert@gmail.com'  # Enter your address
    receiver_email = 'shemmelgarn@lowell.edu'  # Enter receiver address
    password = 'low311Camer4$'

    msg = MIMEText(f'The camera {stat_id} is showing a failure at {current_time}')

    msg['Subject'] = 'Camera Fail'
    msg['From'] = 'LOCAMS Alert'
    msg['To'] = 'shemmelgarn@lowell.edu'

    context = ssl.create_default_context()

    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, msg.as_string())

    print('An email alert has been sent!')
    return None


if __name__ == '__main__':
    main()