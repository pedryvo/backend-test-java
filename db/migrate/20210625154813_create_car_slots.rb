class CreateCarSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :car_slots do |t|
      t.integer :size
      t.boolean :is_full
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
