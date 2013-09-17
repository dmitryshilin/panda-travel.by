class Article < ActiveRecord::Base
  has_many :article_countries
  has_many :countries, through: :article_countries
  has_attached_file :poster, styles: {thumb: "100x100>"}
end
