class DatePrice < ActiveRecord::Base
  belongs_to :tour

  validates :day_of, :price, :special, :currency, :deadline_date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
