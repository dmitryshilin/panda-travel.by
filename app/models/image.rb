class Image < ActiveRecord::Base
  belongs_to :tour
  has_attached_file :image, styles: { small: '70x60#',medium: '320x236#', large: '468x340#' }
end
