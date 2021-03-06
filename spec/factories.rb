FactoryBot.define do
  factory :report do
    catch_id { 1 }
    name { "MyString" }
    phone { "MyString" }
    email { "MyString" }
    issue { "MyText" }
  end
  factory :user do
    email { "MyString" }
    name { "MyString" }
    fishery_id { 1 }
  end
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
    nutrients {
      [
        {
          'name' => 'Water',
          'group' => 'Proximates',
          'unit' => 'g',
          'value' => 68.09
        }
      ]
    }
  end

  factory :catch do
    fish
    fishery
    code { "ABC123" }
    latitude { 46.707684 }
    longitude { -62.136615 }
    location { 'Pacific Ocean' }
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