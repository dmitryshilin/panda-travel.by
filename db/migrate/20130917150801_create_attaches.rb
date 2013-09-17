class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.references :tour, index: true
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
