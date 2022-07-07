# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Case.destroy_all
Department.destroy_all

fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
upd = Department.create!(name: 'Urban Police Department', address: "777 Local Lane, Boulder, CO 80304", jurisdiction: "Local County", active_cases: 61, is_federal: false)
doj = Department.create!(name: 'Department of Justice', address: "112 Justice Street, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 127, is_federal: true)
atf = Department.create!(name: 'Bureau of Alcohol, Tobacco, Firearms, and Explosives', address: "808 Wacky Tabacky Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
dea = Department.create!(name: 'Drug Enforcement Agency', address: "666 Dare Drive, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
usm = Department.create!(name: 'U.S. Marshals', address: "123 Howdy Junction, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)

fbi.cases.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
fbi.cases.create!(subject: 'Wanted Fugitive', uid: "abalke83792ky78991", active: true, active_leads: 524)

upd.cases.create!(subject: 'Robbery', uid: "updlke83792ks1001", active: true, active_leads: 2301)
upd.cases.create!(subject: 'Assault', uid: "updlke83792ks10181", active: false, active_leads: 2301)

doj.cases.create!(subject: 'Cyber Crimes', uid: "dojlke83792ks1001", active: true, active_leads: 940)
doj.cases.create!(subject: 'Domestic Terorism', uid: "dojlke83792ka1501", active: true, active_leads: 240)

atf.cases.create!(subject: 'Rape, Falure to appear, Firearms violations', uid: "atflke83792ks1001", active: true, active_leads: 540)
atf.cases.create!(subject: 'Felon in Possession of a Firearm', uid: "atflke83792ks1001", active: true, active_leads: 240)

dea.cases.create!(subject: 'Money Laundering', uid: "dealke83792ks1001", active: true, active_leads: 340)
dea.cases.create!(subject: 'Murder: Second Degree ', uid: "dealke83792ks3531", active: true, active_leads: 240)

usm.cases.create!(subject: 'Major Fugitive', uid: "usmlke83792ks1001", active: true, active_leads: 500)
usm.cases.create!(subject: 'Federal Firearms Violations', uid: "usmlke83792ks126a", active: true, active_leads: 640)