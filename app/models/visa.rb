class Visa < ActiveRecord::Base
  has_many :tours, through: :visa_tours
  has_many :visa_tours

  validates :title, :description, presence: true
  validates :title, length: { in: 5..50 }
  validates :description, length: { in: 5..1000 }
end
