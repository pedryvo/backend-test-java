size = (10..20).to_a.sample

FactoryBot.define do
  factory :slots_field do
    company
    car_slots_size { size }
    moto_slots_size { size }
    busy_car_slots { 0 }
    busy_moto_slots { 0 }
  end
end
