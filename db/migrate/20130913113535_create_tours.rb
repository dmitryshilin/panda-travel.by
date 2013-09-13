class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
