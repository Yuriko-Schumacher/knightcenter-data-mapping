# Here's where we'll put our Make commands
greeting:
	echo 'hello world'

math:
	expr 2 + 2

# you can run 'make all' to run all these make commands at once
all: directories downloads freshdata

directories:
	-mkdir tmp
	-mkdir data

# download raw data from url
downloads:
	curl "https://www.imf.org/external/datamapper/api/v1/PCPIPCH?periods=2023" -o tmp/inflation.json
	curl "https://www.imf.org/external/datamapper/api/v1/countries" -o tmp/countries.json

# process data
freshdata:
	node imf_to_csv.js
