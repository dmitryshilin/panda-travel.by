class DatePrice < ActiveRecord::Base
  belongs_to :tour, touch: true

  validates :day_of, :price, :special, :currency, :deadline_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def self.nearest
    DatePrice.where('deadline_date > ?', Date.today).order('deadline_date ASC').first
  end
end
