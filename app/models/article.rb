class Article < ActiveRecord::Base
  has_many :article_countries
  has_many :countries, through: :article_countries

  scope :published, -> { where(published: true) }

  validates :short_title, :title, :content, presence: true
  validates :short_title, :title, uniqueness: true
  validates :short_title, length: { in: 5..20 }
  validates :title, length: { in: 5..40 }
  validates :content, length: { in: 5..250 }
end
