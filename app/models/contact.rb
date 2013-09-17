class Contact < ActiveRecord::Base
  belongs_to :manager
  has_attached_file :logo, styles: {thumb: "100x100>"}
end
