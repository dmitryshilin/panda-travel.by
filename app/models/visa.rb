class Visa < ActiveRecord::Base
  has_many :tours, through: :visa_tours
  has_many :visa_tours
  validates_presence_of :title, :description
  validates_length_of :title, within: 5..50
  validates_length_of :description, within: 50..1000
end
