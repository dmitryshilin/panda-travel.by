class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :description
      t.references :manager, index: true

      t.timestamps
    end
  end
end
