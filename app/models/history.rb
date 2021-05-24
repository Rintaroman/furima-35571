class History < ApplicationRecord
  belongs_to :use
  belongs_to :furima
  has_one :buyer
  
end
