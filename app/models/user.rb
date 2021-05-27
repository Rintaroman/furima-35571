class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname          
    validates :name               
    validates :first_name         
    validates :name_kana         
    validates :first_name_kana   
    validates :birthday          
    validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
    validates :name
    validates :first_name
  end

  with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
    validates :name_kana
    validates :first_name_kana
  end

  has_many :furimas
  has_many :histories
end

