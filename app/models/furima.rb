class Furima < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :content
    validates :price,numericality: { in: 300..9999999 },format:{with: /\A[0-9]+\z/}
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :time_required_id
  end

  
