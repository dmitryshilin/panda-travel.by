class VisaTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :visa
end
