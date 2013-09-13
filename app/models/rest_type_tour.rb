class RestTypeTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :rest_type
end
