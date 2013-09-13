class CreateVisaTours < ActiveRecord::Migration
  def change
    create_table :visa_tours do |t|
      t.references :tour, index: true
      t.references :visa, index: true

      t.timestamps
    end
  end
end
