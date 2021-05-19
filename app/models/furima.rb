class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_charge, :prefecture, :time_required
  has_one_attached :image

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
end
  
