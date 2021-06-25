class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :color, :license_plate, :kind
end
