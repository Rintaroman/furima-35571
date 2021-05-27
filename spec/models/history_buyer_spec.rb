require 'rails_helper'

RSpec.describe HistoryBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      user1 = FactoryBot.create(:user)
      
      furima = FactoryBot.create(:furima)
      sleep(1)
      @history_buyer = FactoryBot.build(:history_buyer, user_id: user1.id, furima_id: furima.id)
    end
    context '購入ができている場合' do
      it '正しく入力ができていれば購入できる場合' do
        expect(@history_buyer).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @history_buyer.building_name = ''
        expect(@history_buyer).to be_valid
      end
    end


    context '購入ができない場合' do
      it 'postal_codeが空だと購入できないこと' do
        @history_buyer.postal_code = ''
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンを含んでいないと購入できないこと' do
        @history_buyer.postal_code = '1112222'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが全角数字では購入できないこと' do
        @history_buyer.postal_code = '１１１-２２２２'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが--では購入できない場合' do
        @history_buyer.prefecture_id= 0
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが空だと購入できないこと' do
        @history_buyer.city = ''
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @history_buyer.address = ''
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @history_buyer.phone_number = ''
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上では購入できないこと' do
        @history_buyer.phone_number = '123456123456'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空では購入できないこと" do
        @history_buyer.token = nil
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐付いていないと購入できないこと' do
        @history_buyer.user_id = nil
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'furima_idが紐付いていないと購入できないこと' do
        @history_buyer.furima_id = nil
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Furima can't be blank")
      end
      it 'phone_numberは英数混合では購入できないこと' do
        @history_buyer.phone_number = '123aaaabbbb'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_number英字のみでは購入できないこと' do
        @history_buyer.phone_number = 'aaaaaaabbbb'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numberは全角数字の場合購入できないこと' do
        @history_buyer.phone_number = '１２３４５６７８９１２'
        @history_buyer.valid?
        expect(@history_buyer.errors.full_messages).to include("Phone number is not a number")
      end


    end


  end
  
end
