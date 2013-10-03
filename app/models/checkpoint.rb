class Checkpoint < ActiveRecord::Base
  belongs_to :tour
  belongs_to :city

  validates :title, presence: true
  validates :title, length: { in: 2..250 }
end
