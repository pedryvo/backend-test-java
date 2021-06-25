class CreateParkingTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_tickets do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
