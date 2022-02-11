import wget
import ssl
from astropy.table import Table
import os
import matplotlib.pyplot as plt
import urllib
import datetime

ssl._create_default_https_context = ssl._create_unverified_context


def main():
    #station_exceptions = get_locams_exceptions('Station')
    #plot_total_exceptions(station_exceptions)
    #date_total_exceptions = exceptions_by_date()
    #plot_by_date(date_total_exceptions)
    #camera_exceptions = by_camera()
    #plot_by_camera(camera_exceptions)
    location_exceptions = get_locams_exceptions('Location')
    create_location_pie(location_exceptions['Cam Fails'], 'Cam Fails')
    create_location_pie(location_exceptions['Cam False'], 'Cam False')
    create_location_pie(location_exceptions['Unknown Cams'], 'Unknown Cams')

def by_camera():
    # Creates a dictionary of LOCAMS cameras and values associated with their aggregate exceptions over time
    # Create a dictionary of LOCAMS stations and set them all to zero
    locams = {'USL00A': 0, 'USL00B': 0, 'USL00C': 0, 'USL00D': 0, 'USL00E': 0, 'USL00F': 0, 'USL00G': 0, 'USL00H': 0,
              'USL00J': 0, 'USL00K': 0, 'USL00L': 0, 'USL00M': 0, 'USL00N': 0, 'USL00P': 0, 'USL00Q': 0, 'USL00R': 0,
              'USL00S': 0, 'USL00T': 0, 'USL00U': 0, 'USL00V': 0, 'USL00W': 0, 'USL001': 0, 'USL002': 0, 'USL003': 0,
              'USL004': 0, 'USL005': 0, 'USL006': 0, 'USL007': 0, 'USL008': 0, 'USL009': 0}
    date = calculate_date()[0]
    delta = calculate_date()[1]
    end_date = calculate_date()[2]
    while date <= end_date:
        try:
            exceptions = get_exceptions(date.strftime('%Y'), date.strftime('%m'), date.strftime('%d'), 'Station')
            for i in exceptions.values():
                for camera in i:
                    locams[camera] += 1
            date += delta
        except(urllib.error.HTTPError):
            date += delta
    return locams


def calculate_date():
    # May change default date, data starts on 6/21/2021
    date = datetime.date(2021, 6, 21)
    delta = datetime.timedelta(days=1)
    end_date = datetime.date.today() - delta
    return date, delta, end_date


def create_location_pie(data_list, category):
    # Creates pie charts showing percentage of exceptions by location
    locations_dict = {'LDT': 0, 'MH': 0, 'PRE': 0, 'SED': 0, 'WR': 0}
    date = calculate_date()[0]
    end_date = calculate_date()[2]
    for location in data_list:
        locations_dict[location] += 1
    exceptions = list(locations_dict.values())
    labels = list(locations_dict.keys())
    plt.pie(exceptions, labels=labels, autopct='%.2f%%', wedgeprops={'linewidth': 1.0, 'edgecolor': 'black'})
    plt.title(f'Exception: {category}\n By Location\n From {date.strftime("%x")} to {end_date.strftime("%x")}',
              fontweight='bold')
    plt.tight_layout()
    plt.show()
    print(category, exceptions, labels, locations_dict)


def exceptions_by_date():
    # Creates a dictionary with the date as the key and total exceptions for that date as the value
    # Initialize date variables and create and empty dictionary
    date = calculate_date()[0]
    delta = calculate_date()[1]
    end_date = calculate_date()[2]
    exceptions_by_date = {}

    # Get all exceptions by date over time
    while date <= end_date:
        try:
            # Go to the website of a particular date
            year = date.strftime("%Y")
            month = date.strftime("%m")
            day = date.strftime("%d")
            total_exceptions = 0

            # Get all of the exceptions for that date
            date_data = get_exceptions(year, month, day, 'Station')

            # Count total exceptions for that date
            total_exceptions += len(date_data['Cam Fails'])
            total_exceptions += len(date_data['Cam False'])
            total_exceptions += len(date_data['Unknown Cams'])

            # Add to a dictionary with date as key and total exceptions as value
            exceptions_by_date[date] = total_exceptions

            date += delta

        except(urllib.error.HTTPError):
            date += delta

    # Return the dictionary
    return exceptions_by_date


def fail_cams(camera_status, grouping):
    # Runs through the table and creates a list of all the cameras whose platepar status is 'CamFail'
    cam_fail_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'CamFail':
            cam_fail_list.append(camera_status[grouping][row])
    return cam_fail_list


def false_cams(camera_status, grouping):
    # Runs through the table and creates a list of all the cameras whose platepar status is 'False'
    false_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'False':
            false_list.append(camera_status[grouping][row])
    return false_list


def get_locams_exceptions(grouping):
    # This function creates a dictionary of data reflecting the three exception categories that are indicative of
    # hardware issues either by camera ('Station') or by station location ('Location')
    date = calculate_date()[0]
    delta = calculate_date()[1]
    end_date = calculate_date()[2]
    exceptions_data = {'Cam Fails': [], 'Cam False': [], 'Unknown Cams': []}
    while date <= end_date:
        try:
            year = date.strftime("%Y")
            month = date.strftime("%m")
            day = date.strftime("%d")
            date_data = get_exceptions(year, month, day, grouping)
            exceptions_data['Cam Fails'] += date_data['Cam Fails']
            exceptions_data['Cam False'] += date_data['Cam False']
            exceptions_data['Unknown Cams'] += date_data['Unknown Cams']
            date += delta
        except(urllib.error.HTTPError):
            date += delta
    return exceptions_data


def get_exceptions(year, month, day, grouping):
    # Goes through the table created from the website and assigns cameras to a dictionary according to platepar status
    data_dict = {}
    exception_table = get_url(year, month, day)
    platepar_status = exception_table.group_by('Platepar_Good')
    if grouping == 'Station':
        camera_status = platepar_status.group_by(['Platepar_Good', 'Station']).groups.keys
    if grouping == 'Location':
        camera_status = platepar_status.group_by(['Platepar_Good', 'Station', 'Location']).groups.keys
    data_dict['Cam Fails'] = fail_cams(camera_status, grouping)
    data_dict['Cam False'] = false_cams(camera_status, grouping)
    data_dict['Unknown Cams'] = unknown_cams(camera_status, grouping)
    return data_dict


def get_url(year, month, day):
    # Goes to the website for a particular date and creates a table from the data
    url = f'https://locams.lowell.edu/data/Log_{year}{month}{day}.txt'
    data_file = wget.download(url)
    log_table = Table.read(data_file, format='ascii')
    os.remove(data_file)
    return log_table


def plot_by_date(exceptions_by_date):
    # Creates a plot of total LOCAMS exception by day over time
    plt.plot(exceptions_by_date.keys(), exceptions_by_date.values(),  color='indigo', marker='.', linewidth=.5)
    plt.xticks(rotation=90)
    plt.title(f'LOCAMS Exceptions Over Time \n {calculate_date()[0].strftime("%x")} thru {calculate_date()[2].strftime("%x")}',
              fontweight='bold')
    plt.ylabel('Exceptions', fontweight='bold')
    plt.xlabel('Year/Month', fontweight='bold')
    plt.grid()
    plt.tight_layout()
    plt.show()


def plot_by_camera(camera_total_exceptions):
    # Function creates a horizontal bar chart showing total exceptions associated with a camera over time
    stations = list(camera_total_exceptions.keys())
    station_exceptions = list(camera_total_exceptions.values())
    plt.barh(stations, station_exceptions, )
    plt.title(f'LOCAMS Exceptions by Camera \n {calculate_date()[0].strftime("%x")} thru {calculate_date()[2].strftime("%x")}',
              fontweight='bold')
    plt.ylabel('Station Code', fontweight='bold')
    plt.xlabel('Exceptions', fontweight='bold')
    plt.grid(axis='x')
    plt.tight_layout()
    plt.show()


def plot_total_exceptions(exceptions_data):
    # Assign all variables used in the function
    yesterday = calculate_date()[2]
    x = exceptions_data.keys()
    colors = ['dodgerblue', 'darkgreen', 'darkorchid']
    cam_fails = len(exceptions_data['Cam Fails'])
    cam_false = len(exceptions_data['Cam False'])
    unknown = len(exceptions_data['Unknown Cams'])
    exceptions = [cam_fails, cam_false, unknown]

    # Set up bar chart, labels, and parameters
    bar_plot = plt.bar(x, exceptions, color=colors, edgecolor='black')
    for index, rect in enumerate(bar_plot):
        height = rect.get_height()
        plt.text(rect.get_x() + rect.get_width()/2., height, exceptions[index], ha='center', va='bottom',
            rotation=0)
    plt.ylim(top=max(exceptions)+100)
    plt.xlabel('Exceptions', fontweight='bold')
    plt.title(f'LOCAMS Exceptions\n {calculate_date()[0].strftime("%x")} thru {yesterday.strftime("%x")}', fontweight='bold')
    plt.tight_layout()

    # Show bar chart
    plt.show()


def uncalib_cams(camera_status, grouping):
    # Runs through the table and creates a list of all the cameras whose platepar status is 'Uncalib'
    uncalib_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'Uncalib':
            uncalib_list.append(camera_status[grouping][row])
    return uncalib_list


def unknown_cams(camera_status, grouping):
    # Runs through the table and creates a list of all the cameras whose platepar status is 'Unknown'
    unknown_list = []
    for row in range(len(camera_status)):
        if camera_status['Platepar_Good'][row] == 'Unknown':
            unknown_list.append(camera_status[grouping][row])
    return unknown_list


if __name__ == "__main__":
    main()
