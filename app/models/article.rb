class Article < ActiveRecord::Base
  has_many :article_countries
  has_many :countries, through: :article_countries
end
