options = [0,1]

FactoryBot.define do
  factory :vehicle do
    brand { Faker::Vehicle.manufacture }
    model { Faker::Vehicle.model }
    color { Faker::Color.color_name }
    license_plate { Faker::Vehicle.license_plate }
    kind { options.sample }
  end
end
