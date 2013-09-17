class RestType < ActiveRecord::Base
  has_many :tours, through: :rest_type_tours
  has_many :rest_type_tours

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..20 }
end
