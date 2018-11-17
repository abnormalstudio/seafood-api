fishery = Fishery.create!(
  name: "Tony's Tuna Fishing",
  address: "249 Elmira Rd, Souris, PE C0A 2B0",
  contact: "Tony",
  phone: "(902) 969-7735",
  email: "tonymacdonald@hotmail.ca",
  website: "http://www.tonystunafishing.com")

salmon = Fish.create!(
  species: 'Salmon',
  mercury_mean_ppm: 0.022,
  mercury_num_samples: 94)
shrimp = Fish.create!(
  species: 'Shrimp',
  mercury_mean_ppm: 0.009,
  mercury_num_samples: 40)
tuna = Fish.create!(
  species: 'Tuna',
  mercury_mean_ppm: 0.144,
  mercury_num_samples: 3)

catch1 = Catch.create!(
  fish: tuna,
  fishery: fishery,
  latitude: 46.707684,
  longitude: -62.136615,
  caught_on: 10.days.ago.to_date)

scan1 = Scan.create!(
  catch: catch1,
  latitude: 47.051566,
  longitude: -70.770923,
  scanner: 'Quebec Importing',
  scanned_at: 8.days.ago)
scan2 = Scan.create!(
  catch: catch1,
  latitude: 46.506704,
  longitude: -72.363280,
  scanner: 'Purolator',
  scanned_at: 7.days.ago)
scan3 = Scan.create!(
  catch: catch1,
  latitude: 43.982844,
  longitude: -78.405742,
  scanner: 'Loblaws',
  scanned_at: 4.days.ago)
scan4 = Scan.create!(
  catch: catch1,
  latitude: 43.561348,
  longitude: -80.247635,
  scanner: 'Guelph Loblaws',
  scanned_at: 2.days.ago)