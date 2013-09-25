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
  scope :get_random, ->(number) { where(:id => published.pluck(:id).sort_by { rand }.slice(0, number)) }

  def first_manager
    self.managers.try(:first)
  end

  def special_price
    tmp = self.date_prices.where('deadline_date > ?', Date.today)
    tmp.where(special: true).order('deadline_date ASC').first.try(:price)
  end

  def price
    self.date_prices.where('deadline_date > ?', Date.today).order('deadline_date ASC').first.try(:price)
  end

  def dates_of
    self.date_prices.where('deadline_date > ?', Date.today).order('deadline_date ASC').where(special: false).first(5)
  end

  def special_dates_of
    self.date_prices.where('deadline_date > ?', Date.today).order('deadline_date ASC').where(special: true).first(5)
  end
end
