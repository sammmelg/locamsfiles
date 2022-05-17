import datetime
import os
import glob
import RMS.ConfigReader as cr
from RMS.CaptureDuration import captureDuration
import os
import time
import slack_sdk


stat_id = str(os.uname()[1])
config = cr.loadConfigFromDirectory('.', os.path.abspath('/home/pi/source/RMS'))
cap_time = captureDuration(config.latitude, config.longitude, config.elevation)
start_time = cap_time[0]
utc_now = datetime.datetime.utcnow()
open_time = datetime.datetime.now()
wait = start_time - utc_now
seconds = wait.total_seconds()
total_wait = seconds + 300
time.sleep(total_wait)


def main():
    # Get the current log
    file = get_current_log()[0]

    # Read the log to see if the camera opened, if camera not opened for capture then camera status = False
    camera_status = read_log(file)

    # If the camera is not open, send an email
    if camera_status == False:
        send_slack_alert()

    log_result(camera_status, file)


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


def log_result(status, current_log):
    # Go to the log directory
    os.chdir('/home/pi/RMS_data/logs')

    # Set current date and time, times recorded are in local time zone
    date = datetime.datetime.now()

    # If the camera opened, write to the log that device open was successful
    if status == True:
        with open('CamStatusLog_' + stat_id + '.txt', 'a+') as logfile:
            logfile.write(date.strftime('%m/%d/%Y %H:%M:%S') + f': Device open was successful! Script opened at {open_time}'
                                                               f' and waited for {total_wait / 60} minutes after opening.'
                                                               f' The log file read was {current_log}\n')

    # If the camera did not open, write to the log that the device was not opened and alert email was sent
    if status == False:
        with open('CamStatusLog_' + stat_id + '.txt', 'a+') as logfile:
            logfile.write(date.strftime('%m/%d/%Y %H:%M:%S') + f': Device not opened, alert sent. Script opened at {open_time}'
                                                               f' and waited for {total_wait / 60} minutes after opening.'
                                                               f' The log file read was {current_log}\n')

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


def send_slack_alert():
    # Get date and time
    now = datetime.datetime.now()
    current_time = now.strftime('%H:%M:%S on %m/%d/%Y')

    # Send a slack alert to LOCAMS alerts slack channel
    slack_token = os.environ.get('SLACK_TOKEN')
    client = slack_sdk.WebClient(token=slack_token)
    client.chat_postMessage(channel='alert-system', text=f'The camera {stat_id} is showing a failure at {current_time}!')

    return None


if __name__ == '__main__':
    main()
