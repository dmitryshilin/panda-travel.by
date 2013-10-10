class RestType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :tours, through: :rest_type_tours
  has_many :rest_type_tours

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :title, length: { in: 3..20 }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
