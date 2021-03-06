require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
     it '全ての情報が存在すれば登録できる' do
       expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の英数混合かつ一致していれば登録できる' do
       @user.password = 'aaa111'
       @user.password_confirmation = 'aaa111'
       expect(@user).to be_valid
     end
    end

    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it '重複したemailが存在する場合登録できない' do
      @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'emailに@が含まれない場合は登録できない' do
       @user.email = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = 'aa000'
       @user.password_confirmation = 'aa000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it 'passwordは英語のみでは登録できない' do
       @user.password = 'aaaaaa'
       @user.password_confirmation = 'aaaaaa'
       @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it 'passwordは数字のみでは登録できない' do
       @user.password = '000000'
       @user.password_confirmation = '000000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is invalid')
     end
      it 'passwordは全角では登録できない' do
       @user.password = 'ＡＢＣ０００'
       @user.password_confirmation = 'ＡＢＣ０００'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it 'passwordとpassword_confirmationが一致していなければ登録できない' do
       @user.password = 'aaa000'
       @user.password_confirmation = 'bbb000'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name can't be blank"
     end
     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name can't be blank"
     end
     it 'first_nameは漢字・ひらがな・カナ以外では登録できない' do
       @user.first_name = 'aaa'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name is invalid')
     end
     it 'last_nameは漢字・ひらがな・カナ以外では登録できない' do
      @user.last_name = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
     end
     it 'first_name_kanaが空では登録できない' do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end
     it 'last_name_kanaが空では登録できない' do
       @user.last_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end
     it 'first_name_kanaは英語では登録できない' do
       @user.first_name_kana = 'aaa'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it 'first_name_kanaは漢字では登録できない' do
       @user.first_name_kana = '山田'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it 'first_name_kanaはひらがなでは登録できない' do
       @user.first_name_kana = 'やまだ'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it 'last_name_kanaは英語では登録できない' do
      @user.last_name_kana = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
     end
     it 'last_name_kanaは漢字では登録できない' do
       @user.last_name_kana = '山田'
       @user.valid?
       expect(@user.errors.full_messages).to include('Last name kana is invalid')
     end
     it 'last_name_kanaはひらがなでは登録できない' do
       @user.last_name_kana = 'やまだ'
       @user.valid?
       expect(@user.errors.full_messages).to include('Last name kana is invalid')
     end
     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
    end
  end
end