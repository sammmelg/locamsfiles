import wget
import ssl
from astropy.table import Table
import os
import matplotlib.pyplot as plt
import datetime

ssl._create_default_https_context = ssl._create_unverified_context


def main():
    url = get_website()
    meteor_table = create_table(url)
    table_headers = get_headers(meteor_table)
    change_headers(table_headers, meteor_table)
    stations = meteor_table.group_by('Participating stations')
    locams_stations = find_locams(stations)
    detections = get_total_detections(locams_stations)
    print(locams_stations, detections)
    date = get_date(url, meteor_table)
    bar_chart(locams_stations, date)


def change_headers(table_headers, meteor_table):
    new_row = []

    for i in range(len(meteor_table.colnames)):
        new_row.append(meteor_table.colnames[i])
        try:
            meteor_table.add_row(new_row)
        except ValueError:
            continue


    for i in range(len(meteor_table.colnames)):
        try:
            meteor_table.rename_column(meteor_table.colnames[i], table_headers[i])
        except KeyError:
            continue


def create_table(url):
    data_file = wget.download(url)
    meteor_table = Table.read(data_file, data_start=2, delimiter=';', format='ascii')
    os.remove(data_file)
    return meteor_table


def get_date(url, meteor_table):
    if 'daily' in url:
        utc_time = meteor_table[0][1]
        date = utc_time[:10]
        timeframe = 'night'
    return date, timeframe


def get_headers(meteor_table):
    table_meta = meteor_table.meta
    header_list = table_meta.get('comments')
    columns = []

    for i in range(1, len(header_list)):
        header_string = header_list[i]
        for column_header in header_string.split(';'):
            column_header = column_header.strip()
            columns.append(column_header)

    second_header = columns[slice(85, 170)]
    columns = columns[slice(0, 85)]
    headers = []

    for i in range(0, 85):
        headers.append(columns[i] + ' ' + second_header[i])
    return headers


def get_website():
    user_date = str(input('What night would you like to view (YYYYMMDD)? '))
    solrange1 = get_solrange(user_date)
    solrange2 = solrange1 + 1
    website = f'https://globalmeteornetwork.org/data/traj_summary_data/daily/traj_summary_{user_date}_solrange_{solrange1}.0-{solrange2}.0.txt'
    print(website)
    return website


def get_solrange(input_date):
    year = int(input_date[:4])
    month = int(input_date[4:6])
    day = int(input_date[6:])
    print(month, day, year)
    locams_gmn_date = datetime.date(2020, 12, 8)
    date = datetime.date(year, month, day)
    if date.month < 3:
        default_year = date.year - 1
    if date.month == 3:
        if date.day < 21:
            default_year = date.year - 1
    default_date = datetime.date(default_year, 3, 21)
    if locams_gmn_date > date:
        print("LOCAMS does not have any data on the GMN website prior to 12/8/2020.\n"
              "Please try a different date. ")
        get_website()
    date_difference = (date - default_date).days
    if date == datetime.date(2021, 5, 17):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 6, 11):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 7, 3):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 7, 24):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 8, 17):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 9, 18):
        print("There is no data for the given date, please input another date.")
        get_website()
    if date == datetime.date(2021, 12, 19):
        solrange = int(input("For the night of 12/19/21, which solrange beginning would you like, 267 or 268? "))
    if default_date < date < datetime.date(2021, 5, 17):
        solrange = date_difference
    if datetime.date(2021, 5, 17) < date < datetime.date(2021, 6, 11):
        solrange = date_difference - 1
    if datetime.date(2021, 6, 11) < date < datetime.date(2021, 7, 3):
        solrange = date_difference - 2
    if datetime.date(2021, 7, 3) < date < datetime.date(2021, 7, 24):
        solrange = date_difference - 3
    if datetime.date(2021, 7, 24) < date < datetime.date(2021, 8, 17):
        solrange = date_difference - 4
    if datetime.date(2021, 8, 17) < date < datetime.date(2021, 9, 18):
        solrange = date_difference - 5
    if datetime.date(2021, 9, 18) < date < datetime.date(2021, 12, 19):
        solrange = date_difference - 6
    if datetime.date(2021, 12, 20) < date < date.today():
        solrange = date_difference - 5
    return solrange


def find_locams(stations_group):
    # Create a dictionary of LOCAMS stations and set them all to zero
    locams = {'USL00A': 0, 'USL00B': 0, 'USL00C': 0, 'USL00D': 0, 'USL00E': 0, 'USL00F': 0, 'USL00G': 0, 'USL00H': 0,
              'USL00J': 0, 'USL00K': 0, 'USL00L': 0, 'USL00M': 0, 'USL00N': 0, 'USL00P': 0, 'USL00Q': 0, 'USL00R': 0,
              'USL00S': 0, 'USL00T': 0, 'USL00U': 0, 'USL00V': 0, 'USL00W': 0, 'USL001': 0, 'USL002': 0, 'USL003': 0,
              'USL004': 0, 'USL005': 0, 'USL006': 0, 'USL007': 0, 'USL008': 0, 'USL009': 0}

    # loop through the group of stations to find USL cameras and add the detections to the camera
    for i in range(len(stations_group)):
        for cam in locams:
            if cam in stations_group[i]['Participating stations']:
                locams[cam] += 1

    return locams


def get_total_detections(cam_totals):
    total_detections = 0

    for cam in cam_totals:
        cam_detections = cam_totals[cam]
        total_detections += cam_detections
    return total_detections


def bar_chart(station_detections, date):
    cams = list(station_detections.keys())
    detections = list(station_detections.values())
    plt.figure(figsize=(8, 9))
    colors = ['r', 'k']
    detections_chart = plt.barh(cams, detections, color=colors)
    if date[1] == 'night':
        subtitle = 'Night of'
    plt.title(f'Observations by LOCAMS Station\n{subtitle} {date[0]}', loc='center')
    plt.xlabel('Observations', loc='center')
    plt.ylabel('LOCAMS Station', loc='center')
    plt.bar_label(detections_chart, fmt='%.0f')
    plt.gca().invert_yaxis()
    plt.show()


if __name__ == "__main__":
    main()
