class Contact < ActiveRecord::Base
  belongs_to :manager
  has_attached_file :logo
  has_destroyable_file :logo

  validates_presence_of :contact_type, :description
  validates_length_of :contact_type, within: 3..20
  validates_length_of :description, within: 5..40
end
