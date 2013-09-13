class CreateRestTypes < ActiveRecord::Migration
  def change
    create_table :rest_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
