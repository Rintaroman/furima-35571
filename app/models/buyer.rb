class Buyer < ApplicationRecord
  belongs_to :prefecture


  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0 }



end
