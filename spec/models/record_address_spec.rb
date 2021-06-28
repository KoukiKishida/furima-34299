require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '商品購入機能' do
    before do
      product = FactoryBot.create(:product)
      user = FactoryBot.create(:user)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, product_id: product.id)
      # 青字でmysql connection errorのようなエラーがでる
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@record_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @record_address.municipalities = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @record_address.address = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end

      it "9桁以下では登録できないこと" do
        @record_address.phone_number = '090888888'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号は英数混合では登録できないこと" do
        @record_address.phone_number = '090888888aa'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "user_idが空では登録できないこと" do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end

      it "product_idが空では登録できないこと" do
        @record_address.product_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Product can't be blank")
      end

    end
  end
end
