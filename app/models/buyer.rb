class Buyer < ApplicationRecord
  belongs_to :prefecture
  belongs_to :history

end
