class Manager < ActiveRecord::Base
  has_many :contacts
  has_many :tours, through: :manager_tours
  has_many :manager_tours
  validates_presence_of :name
  validates_length_of :name, within: 10..50
end
