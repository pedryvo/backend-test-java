class ParkingTicket < ApplicationRecord
  belongs_to :vehicle
  belongs_to :company

  enum status: [:open, :finished]
end
