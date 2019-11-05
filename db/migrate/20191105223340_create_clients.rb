class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :phone_number
      t.string :address

      t.timestamps
    end
  end
end
