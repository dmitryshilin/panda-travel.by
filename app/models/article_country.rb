class ArticleCountry < ActiveRecord::Base
  belongs_to :tour
  belongs_to :article
end
