class SlotsFieldSerializer < ActiveModel::Serializer
  attributes :car_slots_size, :moto_slots_size, :busy_car_slots, :busy_moto_slots
end
