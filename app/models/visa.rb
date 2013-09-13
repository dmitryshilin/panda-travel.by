class Visa < ActiveRecord::Base
  has_many :tours, through: :visa_tours
  has_many :visa_tours
end
