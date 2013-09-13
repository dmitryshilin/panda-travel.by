class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number
      t.text :description
      t.references :tour, index: true

      t.timestamps
    end
  end
end
