# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Registration.destroy_all
Branch.destroy_all

london = Branch.create(name: "London")
nijmegen = Branch.create(name: "Nijmegen")

Registration.create([
  { start_date: "01-01-2015", end_date: "31-12-2015", consumption_data: "400", verified: false, branch: nijmegen },
  { start_date: "01-01-2016", end_date: "01-03-2016", consumption_data: "100", verified: true, branch: nijmegen },
  { start_date: "01-01-2015", end_date: "31-12-2015", consumption_data: "800", verified: false, branch: london }
])
