class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :notation
      t.references :tour, index: true

      t.timestamps
    end
  end
end
