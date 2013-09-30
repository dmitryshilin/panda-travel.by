class Image < ActiveRecord::Base
  belongs_to :tour
  has_attached_file :image, styles: { thumb: "320x236#" }
end
