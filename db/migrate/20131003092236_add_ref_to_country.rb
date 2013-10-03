class AddRefToCountry < ActiveRecord::Migration
  def change
    add_reference :countries, :city, index: true
  end
end
