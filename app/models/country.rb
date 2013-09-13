class Country < ActiveRecord::Base
  has_many :articles, through: :article_countries
  has_many :article_countries
  has_many :tours, through: :country_tours
  has_many :country_tours
end
