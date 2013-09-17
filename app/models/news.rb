class News < ActiveRecord::Base
  scope :published, -> { where(published: true)}
  #validates_presence_of :short_title, :title, :content
  #validates_length_of :short_title, within: 3..10
  #validates_length_of :title, within: 3..30
  #validates_length_of :content, within: 20..6000
end
