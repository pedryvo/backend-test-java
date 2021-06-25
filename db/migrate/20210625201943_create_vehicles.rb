class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :color
      t.string :license_plate
      t.integer :kind

      t.timestamps
    end
  end
end
