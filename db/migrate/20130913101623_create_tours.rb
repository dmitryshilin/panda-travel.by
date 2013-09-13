class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.boolean :published

      t.timestamps
    end
  end
end
