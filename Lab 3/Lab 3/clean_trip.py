"""Returns a processed version of trip data. Dirty zips are changed to 0"""

import csv

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

def store_zips():	# returns a set of all california zip codes
	res = set()
	zip_codes = read_csv("../free-zipcode-database-Primary.csv")
	zip_codes = zip_codes[1:]

	for row in zip_codes:
		if(row[3] == "CA"):
			res.add(row[0])
	return res


def process_zips(zip_data):	 ## returns csv with modified zip codes
	data = read_csv("trip_raw.csv")
	temp = data[1:]

	for i in range(len(temp)):
		zc = temp[i][-1]
		if len(zc) < 5:
			temp[i][-1] = 0
		else:
			zc = zc[:5]
			if zc not in zip_data:
				temp[i][-1] = 0
			else:
				temp[i][-1] = zc

	with open("trip_processed.csv", 'w', newline='') as f:
		writer = csv.writer(f, delimiter=',')
		writer.writerow(data[0])
		writer.writerows(temp)
	return f


california_zips = store_zips()  # set of all california zip codes
trip_processed = process_zips(california_zips)
