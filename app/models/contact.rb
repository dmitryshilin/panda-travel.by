class Contact < ActiveRecord::Base
  belongs_to :manager
  has_attached_file :logo, styles: {thumb: "100x100>"}

  validates_presence_of :type, :description
  validates_length_of :type, within: 3..20
  validates_length_of :description, within: 5..40

end
