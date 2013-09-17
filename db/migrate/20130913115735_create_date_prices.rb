class CreateDatePrices < ActiveRecord::Migration
  def change
    create_table :date_prices do |t|
      t.date :day_of
      t.decimal :price
      t.boolean :special, default: false
      t.string :currency
      t.date :deadline_date
      t.references :tour, index: true

      t.timestamps
    end
  end
end
