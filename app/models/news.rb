class News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_title, use: :slugged

  scope :published, -> { where(published: true) }
  scope :last_news, ->(number) { published.order('created_at DESC').take(number)}
  validates_presence_of :short_title, :title, :content
  validates_length_of :short_title, within: 3..60
  validates_length_of :title, within: 3..100
  validates_length_of :content, within: 5..6000

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
