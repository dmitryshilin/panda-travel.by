class CreateCountryVisas < ActiveRecord::Migration
  def change
    create_table :country_visas do |t|
      t.references :visa, index: true
      t.references :country, index: true

      t.timestamps
    end
  end
end
