class AddHourPricesToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :hour_price_car, :float
    add_column :companies, :hour_price_motorcycle, :float
  end
end
