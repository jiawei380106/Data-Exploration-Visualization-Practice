## Name: Kaustubh Jagtap
import csv

def read_csv(csvfilename):	## function to read a csv file
	rows = []
	with open(csvfilename) as csvfile:
		file_reader = csv.reader(csvfile)
		for row in file_reader:
			rows.append(row)
	return rows

data = read_csv("Fans.csv")		## read in the file
first_row = data[0]				## isolate the column headers
data = data[1:]

totals = {}		## hash table to store running totals
def getFans(data, first_row):
	for rownum in range(len(data)):
		channel, region = data[rownum][0], data[rownum][3]
		## concatenate the channel and region to get unique key
		concat_val = channel + " " + region					
		## do the appropriate insertion into dictionary
		if(concat_val) not in totals:
			totals[concat_val] = int(data[rownum][4])
			continue
		else:
			totals[concat_val] += int(data[rownum][2])
			data[rownum][4] = totals[concat_val]

	data = [first_row] + data
	with open("newFans.csv", 'w', newline='') as f:
		writer = csv.writer(f, delimiter=',')
		writer.writerows(data)			## write to csv
	return f

getFans(data, first_row)

