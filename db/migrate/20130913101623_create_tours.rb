class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :short_title
      t.string :title
      t.text :description
      t.integer :rating, default: 0
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
