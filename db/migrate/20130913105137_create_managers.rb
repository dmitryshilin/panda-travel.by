class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.attachment :avatar

      t.timestamps
    end
  end
end
