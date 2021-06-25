class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ssn
      t.string :address
      t.string :phone_number
      t.integer :motorcycle_qnt
      t.integer :cars_qnt

      t.timestamps
    end
  end
end
