class SlotsField < ApplicationRecord
  belongs_to :company

  def occupy_moto_slot
    self.busy_moto_slots += 1
  end

  def free_moto_slot
    self.busy_moto_slots -= 1
  end

  def occupy_car_slot
    self.busy_car_slots += 1
  end

  def free_car_slot
    self.busy_moto_slots -= 1
  end
end
