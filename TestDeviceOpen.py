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

# Insert following text into crontab to automate running on the pi at specific time nightly.  Script must be in
# /home/pi/source/RMS/Utils directory:
# SHELL=/bin/sh
# PATH=/home/pi/vRMS/bin:/usr/local/Qt-5.15.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# 00 19 * * * cd /home/pi/source/RMS/Utils && python3.7 TestDeviceOpen.py

# 3/2/2022: Updated script to create a log file indicating daily results.
# 3/29/2022: Added reading config file and determining wait time so that crontab does not need to be updated so often.
#   [Lines 22 thru 30] Added to log with time the script starts along with total_wait [Lines 73, 74 & 80, 81].

stat_id = str(os.uname()[1])
config = cr.loadConfigFromDirectory('.', os.path.abspath('/home/pi/source/RMS'))
cap_time = captureDuration(config.latitude, config.longitude, config.elevation)
start_time = cap_time[0]
utc_now = datetime.datetime.utcnow()
wait = start_time - utc_now
seconds = wait.total_seconds()
total_wait = seconds + 600
time.sleep(total_wait)


def main():
    # Get the current log
    file = get_current_log()[0]

    # Read the log to see if the camera opened, if camera not opened for capture then camera status = False
    camera_status = read_log(file)

    # If the camera is not open, send an email
    if camera_status == False:
        send_email()

    log_result(camera_status)


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


def log_result(status):
    # Go to the log directory
    os.chdir('/home/pi/RMS_data/logs')

    # Set current date and time, times recorded are in local time zone
    date = datetime.datetime.now()

    # If the camera opened, write to the log that device open was successful
    if status == True:
        with open('CamStatusLog_' + stat_id + '.txt', 'a+') as logfile:
            logfile.write(date.strftime('%m/%d/%Y %H:%M:%S') + f': Device open was successful!  Script opened at {utc_now}'
                                                               f' and waited for {total_wait} seconds.\n')

    # If the camera did not open, write to the log that the device was not opened and alert email was sent
    if status == False:
        with open('CamStatusLog_' + stat_id + '.txt', 'a+') as logfile:
            logfile.write(date.strftime('%m/%d/%Y %H:%M:%S') + f': Device not opened, alert sent.  Script opened at '
                                                               f'{utc_now} and waited for {total_wait} seconds.\n')

    # Read the current log file, if there are more than 60 lines (days), delete the first line and re-write the file
    log = open('CamStatusLog_' + stat_id + '.txt', 'r')
    lines = log.readlines()
    line_count = len(lines)
    if line_count > 60:
        del lines[0]
        new_log = open('CamStatusLog_' + stat_id + '.txt', 'w')
        for line in lines:
            new_log.write(line)


def read_log(infile):
    # Open and read the log file
    with open(infile, 'r') as log_file:
        for line in log_file:

            # if anywhere in the file reads 'The video source could not be opened!', return False
            if 'The video source could not be opened!' in line:
                return False

    # If log does not read 'The video source could not be opened!', return True
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

    return None


if __name__ == '__main__':
    main()
