class ParkingTicketSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :company_name, :vehicle_license_plate, :vehicle_kind, :starting_time, :finishing_time

  def company_name
    object.company.name
  end

  def total_price
    spent_hours = ((object.updated_at.to_time - object.created_at.to_time) / 1.hours).round(2)

    if object.vehicle.motorcycle?
      (object.company.hour_price_motorcycle * spent_hours).round(2)
    elsif object.vehicle.car?
      (object.company.hour_price_car * spent_hours).round(2)
    end
  end

  def vehicle_license_plate
    object.vehicle.license_plate
  end
  
  def vehicle_kind
    object.vehicle.kind
  end

  def starting_time
    object.created_at.strftime("%H:%M:%S - %d/%m/%Y")
  end

  def finishing_time
    object.updated_at.strftime("%H:%M:%S - %d/%m/%Y")
  end
end
