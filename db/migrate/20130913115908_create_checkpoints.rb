class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :title
      t.references :tour, index: true

      t.timestamps
    end
  end
end
