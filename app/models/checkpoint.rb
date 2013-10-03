class Checkpoint < ActiveRecord::Base
  belongs_to :tour
  has_many :countries

  validates :title, presence: true
  validates :title, length: { in: 2..250 }
end
