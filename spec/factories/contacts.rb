# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do

  	first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.first_name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city}
    state { Faker::Address.state_abbr }
    country {Faker::Lorem.characters(20)}
    postal_code { Faker::Address.postcode }
    sequence(:phone_number, 1000) { |n| "978-443-#{n}" }
    email { Faker::Internet.email}

  end
end
