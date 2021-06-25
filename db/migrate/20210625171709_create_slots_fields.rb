class CreateSlotsFields < ActiveRecord::Migration[6.1]
  def change
    create_table :slots_fields do |t|
      t.integer :car_slots_size
      t.integer :moto_slots_size
      t.integer :busy_car_slots
      t.integer :busy_moto_slots
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
