require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、password、name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'name_seiが空では登録できない' do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name sei can't be blank"
      end
      it 'name_meiが空では登録できない' do
        @user.name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name mei can't be blank"
      end
      it 'name_sei_kanaが空では登録できない' do
        @user.name_sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name sei kana can't be blank"
      end
      it 'name_sei_kanaが空では登録できない' do
        @user.name_mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name mei kana can't be blank"
      end
      it 'name_sei_kanaが空では登録できない' do
        @user.name_sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name sei kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'emailには必ず＠を含むこと' do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが一意性であること' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('has already been taken')
      end
      it 'passwordが６文字以上でないと登録できないこと' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid')
      end
      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = '１AAAAAA'
        @user.password_confirmation = '１AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'name_seiが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_sei = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei is invalid')
      end
      it 'name_meiが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_mei = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei is invalid')
      end
      it 'name_sei_kanaが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_sei_kana = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name sei kana is invalid')
      end
      it 'name_mei_kanaが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_mei_kana = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name mei kana is invalid')
      end
    end
  end
end
