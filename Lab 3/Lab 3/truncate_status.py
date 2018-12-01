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

def truncate_status():	 ## returns csv with modified zip codes
	print("Running")
	data = read_csv("status.csv")
	temp = data[:1000]
	print("Created temp")
	with open("status_truncated.csv", 'w', newline='') as f:
		writer = csv.writer(f, delimiter=',')
		writer.writerows(temp)
	return f

status_truncated = truncate_status()