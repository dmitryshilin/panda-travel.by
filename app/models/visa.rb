class Visa < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tours, through: :visa_tours
  has_many :visa_tours
  has_many :countries, through: :country_visa
  has_many :country_visa

  validates :title, :description, presence: true
  validates :title, length: { in: 5..50 }
  validates :description, length: { in: 5..1000 }
end
