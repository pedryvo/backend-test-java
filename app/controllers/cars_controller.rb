class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :delete]
  
  def index
    @cars = Car.all
    render json: @cars, status: :ok
  end

  def show
    render json: @car, status: :ok
  end

  def create
    car = Car.create(car_params)
    if car
      render json: car, status: :created
    end
  end

  def update
    if @car.update(car_params)
      render json: @car, status: :accepted
    end
  end

  def delete
    if @car.destroy
      render json: { 'message': "Car #{@car.license_plate} was successfully destroyed." }, status: :no_content
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :color, :license_plate, :type)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
