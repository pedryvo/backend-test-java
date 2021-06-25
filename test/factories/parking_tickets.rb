FactoryBot.define do
  factory :parking_ticket do
    vehicle { nil }
    company { nil }
    status { 1 }
  end
end
