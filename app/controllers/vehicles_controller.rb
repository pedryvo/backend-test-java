class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :delete]
  
  def index
    @vehicles = Vehicle.all
    render json: @vehicles, status: :ok
  end

  def show
    render json: @vehicle, status: :ok
  end

  def create
    vehicle = Vehicle.create(vehicle_params)
    if vehicle
      render json: vehicle, status: :created
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle, status: :accepted
    end
  end

  def delete
    if @vehicle.destroy
      render json: { 'message': "Vehicle #{@vehicle.license_plate} was successfully destroyed." }, status: :no_content
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :color, :license_plate, :type)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
