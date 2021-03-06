require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '画像と商品名、商品説明、カテゴリー、商品状態、配送料負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる' do
        expect(@product).to be_valid
      end

      it '販売価格9,999,999円であれば登録できる' do
        @product.price = 9999999
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end


      it '商品名が空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product name can't be blank"
      end

      it '商品説明が空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end

      it '商品のカテゴリー情報が空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category is not a number'
      end

      it '商品の状態についての情報が空では登録できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include 'Status is not a number'
      end

      it '配送料の負担についての情報が空では登録できない' do
        @product.burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include 'Burden is not a number'
      end

      it '発送までの日数についての情報が空では登録できない' do
        @product.day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include 'Day is not a number'
      end

      it '販売価格についての情報が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank", 'Price is not a number'
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能である' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '販売価格は半角数字のみ保存可能である' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end

      it 'カテゴリー情報は1(---)では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category must be other than 1'
      end

      it '商品状態情報は1(---)では登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Status must be other than 1'
      end

      it '配送負担情報は1(---)では登録できない' do
        @product.burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Burden must be other than 1'
      end

      it '発送元の地域は1(---)では登録できない' do
        @product.prefectures_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefectures must be other than 1'
      end

      it '発送までの日数は1(---)では登録できない' do
        @product.day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Day must be other than 1'
      end

      it '金額は半角英数混合では登録できないこと' do
        @product.price = '100０００'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end

      it '金額は半角英数混合では登録できないこと' do
        @product.price = 'aaaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能である' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be less than 10000000'
      end
    end
  end
end
