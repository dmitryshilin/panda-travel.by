class Order < ActiveRecord::Base
  belongs_to :tour
  #validates_presence_of :name, :phone, :email, :notation
end
