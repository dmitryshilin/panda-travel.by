class Manager < ActiveRecord::Base
  has_many :contacts
  has_many :tours, through: :manager_tours
  has_many :manager_tours
  accepts_nested_attributes_for :contacts, allow_destroy: true
  has_attached_file :avatar, styles: { thumb: '100x100>' }
  has_destroyable_file :avatar_delete

  validates_presence_of :name
  validates_length_of :name, within: 10..50

end
