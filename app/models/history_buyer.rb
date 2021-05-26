class HistoryBuyer
  include ActiveModel::Model
  
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :prefecture_id, :user_id, :furima_id, :token
  
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :furima_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  validates :phone_number, length: {maximum: 11 }, numericality: { only_integer: true}

  def save

    history = History.create(
      user_id: user_id, 
      furima_id: furima_id )

    Buyer.create(
      history_id: history.id,
      postal_code: postal_code, 
      city: city, 
      address: address, 
      building_name: building_name, 
      phone_number: phone_number, 
      prefecture_id: prefecture_id, 
    )
  end


end