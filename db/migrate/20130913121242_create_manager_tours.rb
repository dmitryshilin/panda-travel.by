class CreateManagerTours < ActiveRecord::Migration
  def change
    create_table :manager_tours do |t|
      t.references :tour, index: true
      t.references :manager, index: true

      t.timestamps
    end
  end
end
