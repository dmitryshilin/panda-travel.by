class AddNotesToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :notes, :string
  end
end
