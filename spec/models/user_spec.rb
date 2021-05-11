require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
      expect(@user.errors.full_messages).to include "Password is invalid"
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
  end
end
