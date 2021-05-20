class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :Prefecture
  belongs_to :time_required
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product
    validates :content
    validates :price
  end
  
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :time_required_id
  end

  validates :price,numericality: { only_integer: true,
                                   greater_than_or_equal_to: 300, 
                                   less_than_or_equal_to: 9_999_999 }

end
