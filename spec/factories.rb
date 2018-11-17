FactoryBot.define do
  factory :fishery do
    name { "Tony's Tuna Fishing" }
    address  { "249 Elmira Rd, Souris, PE C0A 2B0" }
    contact { "Tony" }
    phone { "(902) 969-7735" }
    email { "tonymacdonald@hotmail.ca" }
    website { "http://www.tonystunafishing.com" }
  end

  factory :fish do
    species { "Tuna" }
    mercury_mean_ppm { 0.144 }
    mercury_num_samples { 3 }
  end

  factory :catch do
    fish
    fishery
    code { "ABC123" }
    latitude { 46.707684 }
    longitude { -62.136615 }
    caught_on { Time.zone.parse("2018-10-10").to_date }
  end

  factory :scan do
    association :catch, factory: :catch
    latitude { 47.051566 }
    longitude { -70.770923 }
    scanner { 'Quebec Importing' }
    scanned_at { Time.zone.parse("2018-10-12 10:10:10") }
  end
end