class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :title
      t.references :country, index: true

      t.timestamps
    end
  end
end
