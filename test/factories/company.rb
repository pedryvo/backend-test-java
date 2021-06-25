FactoryBot.define do
  factory :company do
    name { Faker::Company.name + ' Parking Lot' }
    ssn { Faker::Company.brazilian_company_number }
    address { Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.state }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
