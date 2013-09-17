class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_type
      t.string :description
      t.attachment :logo
      t.references :manager, index: true

      t.timestamps
    end
  end
end
