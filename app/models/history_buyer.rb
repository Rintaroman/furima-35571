class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :prefecture_id, :user_id, :furima_id
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :furima_id
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  

  def save
    history = History.create(user_id: user_id, furima_id: furima_id )
    Buyer.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, )
  end


end