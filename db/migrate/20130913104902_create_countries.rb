class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title
      t.text :description
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
