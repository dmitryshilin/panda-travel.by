class AddSlugToVisas < ActiveRecord::Migration
  def change
    add_column :visas, :slug, :string
    add_index :visas, :slug, unique: true
  end
end
