# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def printout(str)
  print str
  $stdout.flush
end

url = "https://data.lacity.org/api/views/eta5-h8qx/rows.json?accessType=DOWNLOAD"

puts "Grabbing data from: " + url

response = HTTParty.get(url)

puts "Loading records"
Map.delete_all

size = response["data"].length

i = 0
response["data"].each do | row |
	i = i + 1
	Map.create(id: row[0], crime: row[16], lat: row[21][1], lon: row[21][2])
	printout "\rProgress: " + i.to_s + " of " + size.to_s
end

puts "Completed"