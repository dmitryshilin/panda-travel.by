class CreateRestTypeTours < ActiveRecord::Migration
  def change
    create_table :rest_type_tours do |t|
      t.references :tour, index: true
      t.references :rest_type, index: true

      t.timestamps
    end
  end
end
