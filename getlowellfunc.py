import os

def get_lowell():
    # Change directory to iStream folder
    os.chdir("/home/pi/source/RMS/iStream")

    # Clone the repo from github
    os.system("git clone "
              "https://sammmelg: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@github.com/sammmelg/"
              "lowell_report/main/lowell_report.py")

    # Change directory into repo folder
    os.chdir("/home/pi/source/RMS/iStream/lowell_report")

    # Move the file up to the iStream folder
    os.system("mv lowell_report.py /home/pi/source/RMS/iStream")

    # Go back to the iStream folder
    os.chdir("/home/pi/source/RMS/iStream")

    # Remove the un-needed folder
    os.remove("/home/pi/source/RMS/lowell_report")