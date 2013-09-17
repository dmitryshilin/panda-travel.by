class Step < ActiveRecord::Base
  belongs_to :tour

  validates :number, :description, presence: true
  validates :number, uniqueness: true
  validates :number, numericality: { greater_than_or_equal_to: 1 }
  validates :description, length: { in: 5..250 }
end
