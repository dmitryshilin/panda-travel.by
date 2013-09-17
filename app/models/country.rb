class Country < ActiveRecord::Base
  has_many :articles, through: :article_countries
  has_many :article_countries
  has_many :tours, through: :country_tours
  has_many :country_tours

  validates :title, :description, :rating, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 2..30 }
  validates :description, length: { in: 5..250 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
end
