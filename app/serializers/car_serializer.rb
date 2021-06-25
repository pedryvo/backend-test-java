class CarSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :color, :license_plate, :type
end
