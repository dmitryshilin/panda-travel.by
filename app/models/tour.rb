class Tour < ActiveRecord::Base
  # include Tire::Model::Search
  # include Tire::Model::Callbacks

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
  has_many :attaches
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :checkpoints, allow_destroy: true
  accepts_nested_attributes_for :attaches, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :date_prices, allow_destroy: true

  validates_length_of :short_title, minimum: 5, maximum: 50
  validates_length_of :title, minimum: 5, maximum: 150
  validates_length_of :description, minimum: 5, maximum: 1000
  validates :short_title, :title, :description, presence: true
  validates :short_title, :title, uniqueness: true
  scope :published, -> { where(published: true) }
  scope :get_random, ->(number) { where(id: published.pluck(:id).sort_by { rand }.slice(0, number)) }

  def first_manager
    managers.try(:first)
  end

  def special_price
    deadlines.where(special: true).first.try(:price)
  end

  def price
    deadlines.first.try(:price)
  end

  def self.hits
    Tour.published.order('rating DESC').first(10)
  end

  def all_dates_of
    date_prices.where('day_of > ?', deadlines.first.try(:deadline_date)).order('day_of ASC')
  end

  def dates_of
    all_dates_of.where(special: false).pluck(:day_of)
  end

  def special_dates_of
    all_dates_of.where(special: true).pluck(:day_of)
  end

  def deadlines
    date_prices.where('deadline_date > ?', Date.today).order('deadline_date ASC')
  end
end
