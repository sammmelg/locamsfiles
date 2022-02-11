import wget
import ssl
from astropy.table import Table
import os
import matplotlib.pyplot as plt
import pprint
import datetime

ssl._create_default_https_context = ssl._create_unverified_context


def main():        
    selection = input("What report would you like to view:\n"
                      "\tExceptions (e) or Observations (o)? ")
    if selection == 'e':
        date = get_date()
        exceptions_data = get_exceptions(date[0], date[1], date[2])
        print(exceptions_data)
        #get_consec = input("Would you like to see how many days in a row cams have had the same exception? ")
        #if get_consec == 'y':
            #date = datetime.date(int(date[0]), int(date[1]), int(date[2]))
            #consec_except(exceptions_data, date)
    if selection == 'o':
        date = get_date()
        get_observations(date[0], date[1], date[2])
    if selection == 'q':
        quit()
    while selection != 'e' or 'o' or 'q':
        selection = input("What report would you like to view:\n"
                          "\tExceptions (e) or Observations (o)? ")
        if selection == 'e':
            date = get_date()
            exceptions_data = get_exceptions(date[0], date[1], date[2])
            print(exceptions_data)
            #get_consec = input("Would you like to see if these cams had the same exceptins yesterday? ")
            #if get_consec == 'y':
                #date = datetime.date(int(date[0]), int(date[1]), int(date[2]))
                #consec_except(exceptions_data, date)
        if selection == 'o':
            date = get_date()
            get_observations(date[0], date[1], date[2])
        if selection == 'q':
            quit()


def consec_except(data, date):
    prev_day = date - datetime.timedelta(days=1)
    prev_except = get_exceptions(str(prev_day.year), str(prev_day.month), str(prev_day.day))
    same_exceptions = 0
    for key in data:
        for i in data.get(key):
            print(i in prev_except.get(key))
    print(data, prev_except, prev_day, same_exceptions)


def fail_cams(camera_status):
    cam_fail_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'CamFail':
            cam_fail_list.append(camera_status['Station'][row])
    return cam_fail_list


def false_cams(camera_status):
    false_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'False':
            false_list.append(camera_status['Station'][row])
    return false_list


def get_date():
    selection = input("What date do you want to view?\nPlease enter in format MMDDYYYY: ")
    year = selection[4:]
    month = selection[0:2]
    day = selection[2:4]
    return year, month, day


def get_exceptions(year, month, day):
    data_list = {}
    exception_table = get_url(year, month, day)
    platepar_status = exception_table.group_by('Platepar_Good')
    camera_status = platepar_status.group_by(['Platepar_Good', 'Station']).groups.keys
    data_list['Cam Fails'] = fail_cams(camera_status)
    data_list['Cam False'] = false_cams(camera_status)
    data_list['Unknown Cams'] = unknown_cams(camera_status)
    data_list['Uncalib Cams'] = uncalib_cams(camera_status)
    return data_list


def get_observations(year, month, day):
    date = f'{month}/{day}/{year}'
    observation_table = get_url(year, month, day)
    observations = observation_table.group_by('Confirmed_Meteor_Obs')
    meteors = observations.group_by(['Confirmed_Meteor_Obs', 'Station', 'Location']).groups.keys
    obs_by_loc(meteors, date)


def get_url(year, month, day):
    url = f'https://locams.lowell.edu/data/Log_{year}{month}{day}.txt'
    data_file = wget.download(url)
    log_table = Table.read(data_file, format='ascii')
    os.remove(data_file)
    return log_table


def obs_by_loc(observations, date):
    meteors_by_loc = {}
    for row in range(len(observations)):
        if observations['Location'][row] in meteors_by_loc:
            meteors_by_loc[observations['Location'][row]] += observations['Confirmed_Meteor_Obs'][row]
        else:
            meteors_by_loc[observations['Location'][row]] = observations['Confirmed_Meteor_Obs'][row]
    locations = list(meteors_by_loc.keys())
    meteors = list(meteors_by_loc.values())
    plt.barh(locations, meteors)
    plt.title(f'Observations by LOCAMS Cameras\nfor {date}')
    plt.xlabel('Observations')
    plt.ylabel('Camera Group')
    plt.margins(x=0.2)
    for obs in range(len(meteors)):
        plt.annotate(str(meteors[obs]), xy=(meteors[obs], locations[obs]), ha='left', va='bottom')
    plt.show()
    print(meteors_by_loc)


def uncalib_cams(camera_status):
    uncalib_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'Uncalib':
            uncalib_list.append(camera_status['Station'][row])
    return uncalib_list


def unknown_cams(camera_status):
    unknown_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'Unknown':
            unknown_list.append(camera_status['Station'][row])
    return unknown_list


if __name__ == "__main__":
    main()
