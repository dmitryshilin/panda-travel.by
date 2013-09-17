class Attach < ActiveRecord::Base
  belongs_to :tour
  validates_length_of :title, within: 5..100
  validates_length_of :url, within: 10..100
  validates_presence_of :url, :title
end
