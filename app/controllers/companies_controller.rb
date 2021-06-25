class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :delete]
  
  def index
    @companies = Company.all
    render json: @companies, status: :ok
  end

  def show
    render json: @company, status: :ok
  end

  def create
    company = Company.create(company_params)
    if company
      company.create_slots_field
      render json: company, status: :created
    end
  end

  def update
    if @company.update(company_params)
      render json: @company, status: :accepted
    end
  end

  def delete
    if @company.destroy
      render json: { 'message': "Company #{@company.name} was successfully destroyed." }, status: :no_content
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :ssn, :address, :phone_number, :motorcycle_qnt, :cars_qnt)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
