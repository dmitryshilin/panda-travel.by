class DatePrice < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  belongs_to :tour

  validates :day_of, :price, :special, :currency, :deadline_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def self.nearest
    DatePrice.where('deadline_date > ?', Date.today).order('deadline_date ASC').first
  end
end
