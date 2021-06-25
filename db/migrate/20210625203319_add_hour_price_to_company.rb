class AddHourPriceToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :hour_price, :float
  end
end
