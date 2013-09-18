class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title
      t.text :description
      t.integer :rating, default: 0
      t.attachment :flag

      t.timestamps
    end
  end
end
