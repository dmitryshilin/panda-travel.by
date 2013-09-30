class Country < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :articles, through: :article_countries
  has_many :article_countries
  has_many :tours, through: :country_tours
  has_many :country_tours
  has_many :visas, through: :country_visa
  has_many :country_visa
  has_attached_file :flag
  has_destroyable_file :flag
  scope :europe, -> { where('region = ?', 'Европа') }
  scope :asia, -> { where('region = ?', 'Азия') }
  scope :africa, -> { where('region = ?', 'Африка') }
  scope :america, -> { where('region = ?', 'Южная Америка') }
  scope :also, -> { where('region = ?', 'А также') }

  validates :title, :description, :region, :rating, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 2..30 }
  validates :description, length: { in: 5..250 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
end
