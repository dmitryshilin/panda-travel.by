class CountryVisa < ActiveRecord::Base
  belongs_to :visa
  belongs_to :country
end
