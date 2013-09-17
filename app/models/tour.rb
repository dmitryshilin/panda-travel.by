class Tour < ActiveRecord::Base
  has_many :checkpoints
  has_many :managers, through: :manager_tours
  has_many :manager_tours
  has_many :countries, through: :country_tours
  has_many :country_tours
  has_many :date_prices
  has_many :images
  has_many :rest_type_tours
  has_many :rest_types, through: :rest_type_tours
  has_many :steps
  has_many :visas, through: :visa_tours
  has_many :visa_tours
  has_many :orders
  validates_length_of :short_title, minimum: 20, maximum: 50
  validates_length_of :title, minimum: 50, maximum: 150
  validates_length_of :description, minimum: 200, maximum: 1000
  validates :short_title, :title, :description, :published, presence: true
  validates :short_title, :title, uniqueness: true
  scope :published, -> { where(published: true) }
end
