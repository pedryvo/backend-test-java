class ParkingController < ApplicationController
  # params_format: { 'company_id': '1', 'vehicle_id': '2', 'park_action': 'entrance' }

  def park
    params.permit!
    ticket_data = params.to_h.slice('company_id', 'vehicle_id', 'park_action')
    has_keys = %w[company_id vehicle_id park_action].all? {|k| ticket_data.key? k}

    if has_keys
      if is_vehicle_parked?(ticket_data['vehicle_id']) && ticket_data['park_action'] == 'entrance'
        render json: {'message': 'Vehicle is already parked.'}, status: :forbidden
      else
        if ticket_data['park_action'] == 'entrance'
          parking_ticket = ParkingTicket.create!( company_id: ticket_data['company_id'],
                                                  vehicle_id: ticket_data['vehicle_id'],
                                                  status: :open)
          if parking_ticket
            render json: parking_ticket, status: :created
            occupy_slot(ticket_data['company_id'], ticket_data['vehicle_id'])
          else
            render json: parking_ticket.full_error_with_messages, status: :bad_request
          end
        elsif ticket_data['park_action'] == 'exit'
          parking_ticket = ParkingTicket.where(vehicle_id: ticket_data['vehicle_id'], status: :open).first
          if parking_ticket.update_attribute(:status, :finished)
            render json: parking_ticket, status: :accepted
            free_slot(ticket_data['company_id'], ticket_data['vehicle_id'])
          else
            render json: parking_ticket.full_error_with_messages, status: :bad_request
          end
        end
      end
    else
      render json: {'message': 'Error. Please check your payload.'}, status: :forbidden
    end
  end

  private

  def occupy_slot(company_id, vehicle_id)
    company = Company.find(company_id)
    vehicle = Vehicle.find(vehicle_id)

    if vehicle.car?
      company.slots_field.occupy_car_slot
    else
      company.slots_field.occupy_moto_slot
    end
  end

  def free_slot(company_id, vehicle_id)
    company = Company.find(company_id)
    vehicle = Vehicle.find(vehicle_id)

    if vehicle.car?
      company.slots_field.free_car_slot
    else
      company.slots_field.free_moto_slot
    end
  end

  def there_are_free_slots?(company_id, vehicle_id)
    company = Company.find(company_id)
    vehicle = Vehicle.find(vehicle_id)

    if vehicle.car?
      company.slots_field.busy_car_slots < car_slots_size
    else
      company.slots_field.busy_moto_slots < moto_slots_size
    end
  end

  def is_vehicle_parked?(vehicle_id)
    vehicle = Vehicle.find(vehicle_id)

    ParkingTicket.where(vehicle_id: vehicle_id, status: :open).any?
  end
end
