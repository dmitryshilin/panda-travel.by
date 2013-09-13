class CountryTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :country
end
