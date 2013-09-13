class Manager < ActiveRecord::Base
  has_many :contacts
  has_many :tours, through: :manager_tours
  has_many :manager_tours
end
