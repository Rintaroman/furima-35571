require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品出品機能' do
    context '商品を出品できる場合' do
      it '全ての項目に正しく入力すれば商品を出品できる' do
        expect(@furima).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'productが空では出品できない場合' do   #bundle exec rspec spec/models/furima_spec.rb
        @furima.product= ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Product can't be blank")
      end
      it 'contentが空では出品できない場合' do
        @furima.content= ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Content can't be blank")
      end
      it 'priceが空では出品できない場合' do
        @furima.price= ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが--では出品できない場合' do
        @furima.category_id= '0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idが--では出品できない場合' do
        @furima.condition_id= '0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'delivery_charge_idが--では出品できない場合' do
        @furima.delivery_charge_id= '0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it 'prefecture_idが--では出品できない場合' do
        @furima.prefecture_id= '0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'time_required_idが--では出品できない場合' do
        @furima.time_required_id= '0'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Time required must be other than 0")
      end

      it 'imageが空では出品できない場合' do
        @furima.image = nil 
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end
      
      it '販売価格が300円未満では出品できない場合' do
        @furima.price= '10'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9999999円を超えたら出品できない' do
        @furima.price= '10000000'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は全角数字では出品できない' do
        @furima.price= '１００００'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end
      
    end
      
  end









end
#bundle exec rspec spec/models/furima_spec.rb
#binding.pry