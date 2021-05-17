require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録できる場合' do
      it '全ての項目に正しく入力すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録ができない' do
        @user.nickname= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'name_kanaが空では登録できない' do     
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailに@がない場合には登録できない' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailがすでに登録されたものと重複していると登録できない' do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.valid?
        expect(user2.errors[:email]).to include("has already been taken")
      end
      it 'passwordが5文字以下なら登録できない' do
        @user.password = 'aA1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字だけなら登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字だけなら登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'AAA１１１'
        @user.password_confirmation = 'AAA１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'nameが全角以外だと登録ができない' do
        @user.name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'first_nameが全角以外だと登録ができない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
        
      end
      it 'name_kanaが全角ひらがなや漢字の場合登録ができない' do
        @user.name_kana = 'た中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width katakana characters.")
      end
      it 'first_name_kanaが全角ひらがなや漢字の場合登録ができない' do
        @user.first_name_kana = 'もも太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end
