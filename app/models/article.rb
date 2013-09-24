class Article < ActiveRecord::Base
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  has_many :article_countries
  has_many :countries, through: :article_countries
  has_attached_file :poster, styles: { thumb: '100x100#' }
  has_destroyable_file :poster

  validates :short_title, :title, :content, presence: true
  validates :short_title, :title, uniqueness: true
  validates :short_title, length: { in: 5..20 }
  validates :title, length: { in: 5..40 }
  validates :content, length: { in: 5..250 }

  scope :published, -> { where(published: true) }

end
