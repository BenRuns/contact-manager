require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name 
    middle_name  =Faker::Name.first_name 
    street_address = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state_abbr,
    country = Faker::Address.country
    postal_code = Faker::Address.postcode,
    phone_number = Faker::PhoneNumber.phone_number
    email  = Faker::Internet.email 

    50.times do |n|
          Contact.create!(:first_name => first_name,
                          :last_name => last_name, 
                          :middle_name => middle_name, 
                          :street_address => street_address,
                          :city  => city,
                          :state => state,
                          :country => country,
                          :postal_code => postal_code,
                          :phone_number  => phone_number,
                          :email  => email )
    end

  end
end