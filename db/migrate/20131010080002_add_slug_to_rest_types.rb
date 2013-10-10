class AddSlugToRestTypes < ActiveRecord::Migration
  def change
    add_column :rest_types, :slug, :string
    add_index :rest_types, :slug, unique: true
  end
end
