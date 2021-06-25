class SlotsField < ApplicationRecord
  belongs_to :company

  def occupy_moto_slot
    self.update_attribute(:busy_moto_slots, self.busy_moto_slots += 1) unless self.busy_moto_slots == self.moto_slots_size
  end

  def free_moto_slot
    self.update_attribute(:busy_moto_slots, self.busy_moto_slots -= 1) unless self.busy_moto_slots == 0
  end

  def occupy_car_slot
    self.update_attribute(:busy_car_slots, self.busy_car_slots += 1) unless self.busy_car_slots == self.car_slots_size
  end

  def free_car_slot
    self.update_attribute(:busy_car_slots, self.busy_car_slots -= 1) unless self.busy_car_slots == 0
  end
end
