class CreateCountryTours < ActiveRecord::Migration
  def change
    create_table :country_tours do |t|
      t.references :tour, index: true
      t.references :country, index: true

      t.timestamps
    end
  end
end
