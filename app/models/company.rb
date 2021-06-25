class Company < ApplicationRecord
  has_one :slots_field
  has_many :parking_tickets
end
