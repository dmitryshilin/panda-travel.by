class ManagerTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :manager
end
