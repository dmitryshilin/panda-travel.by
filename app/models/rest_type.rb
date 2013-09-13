class RestType < ActiveRecord::Base
  has_many :tours, through: :rest_type_tours
  has_many :rest_type_tours
end
