import smtplib
import ssl
import datetime
from email.mime.text import MIMEText
import os
import glob

# find out how to run at a specific time each day (preferably to get capture start time and run
# shortly after that
# Initiate a global variable for station ID, get from config file
stat_id = 'USL00E'

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
    log_search = 'log_' + stat_id + '_' + '20220212' + '_*************.log'

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