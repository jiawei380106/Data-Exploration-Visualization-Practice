""" Looks at weather data; wherever precipitation_inches is stored as 'T', stores 0 instead"""

import csv
import codecs

def read_csv(csvfilename):
    """
    Reads a csv file and returns a list of list
    containing rows in the csv file and its entries.
    """
    rows = []

    with open(csvfilename) as csvfile:
        file_reader = csv.reader(csvfile)
        for row in file_reader:
            rows.append(row)
    return rows

def process_weather():  ## returns csv with modified precipitation inches
    data = read_csv("weather_raw.csv")
    temp = data[1:]

    for i in range(len(temp)):
        if(temp[i][-5]=='T'):
            temp[i][-5] = 0

        for j in range(1, len(temp[i])):
            if(j!=21 and temp[i][j] == ""):
                temp[i][j] = 0

    with open("weather_processed.csv", 'w', newline='') as f:
        writer = csv.writer(f, delimiter=',')
        writer.writerow(data[0])
        writer.writerows(temp)
    return f

weather_processed = process_weather()
