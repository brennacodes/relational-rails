# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Investigation.destroy_all
Department.destroy_all

fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true, created_at: "1962-07-08 01:44:48 UTC")
upd = Department.create!(name: 'Urban Police Department', address: "777 Local Lane, Boulder, CO 80304", jurisdiction: "Local County", active_cases: 61, is_federal: false, created_at: "1966-01-28 10:00:00 UTC")
doj = Department.create!(name: 'Department of Justice', address: "112 Justice Street, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 127, is_federal: true, created_at: "1932-07-08 08:08:08 UTC")
atf = Department.create!(name: 'Bureau of Alcohol, Tobacco, Firearms, and Explosives', address: "808 Wacky Tabacky Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 1516, is_federal: true, created_at: "1978-09-10 02:00:48 UTC")
dea = Department.create!(name: 'Drug Enforcement Agency', address: "666 Dare Drive, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 412, is_federal: true, created_at: "1983-12-25 11:25:00 UTC")
usm = Department.create!(name: 'U.S. Marshals', address: "123 Howdy Junction, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 312, is_federal: true)
nasa = Department.create!(name: 'National Aeronautics and Space Administration', address: "0101 Milky Way, Houston, TX 70351", jurisdiction: "United States of America", active_cases: 3, is_federal: true, created_at: "1953-12-25 11:25:00 UTC")

fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
fbi.investigations.create!(subject: 'Wanted Fugitive', uid: "abalke83792ky78991", active: true, active_leads: 524)

upd.investigations.create!(subject: 'Robbery', uid: "updlke83792ks1001", active: true, active_leads: 2301)
upd.investigations.create!(subject: 'Assault', uid: "updlke83792ks10181", active: false, active_leads: 2301)

doj.investigations.create!(subject: 'Cyber Crimes', uid: "dojlke83792ks1001", active: true, active_leads: 940)
doj.investigations.create!(subject: 'Domestic Terorism', uid: "dojlke83792ka1501", active: true, active_leads: 240)

atf.investigations.create!(subject: 'Rape, Falure to appear, Firearms violations', uid: "atflke83792ks1001", active: true, active_leads: 540)
atf.investigations.create!(subject: 'Felon in Possession of a Firearm', uid: "atflke83792ks1001", active: true, active_leads: 240)

dea.investigations.create!(subject: 'Money Laundering', uid: "dealke83792ks1001", active: true, active_leads: 340)
dea.investigations.create!(subject: 'Murder: Second Degree ', uid: "dealke83792ks3531", active: true, active_leads: 240)

usm.investigations.create!(subject: 'Major Fugitive', uid: "usmlke83792ks1001", active: true, active_leads: 500)
usm.investigations.create!(subject: 'Federal Firearms Violations', uid: "usmlke83792ks126a", active: true, active_leads: 640)