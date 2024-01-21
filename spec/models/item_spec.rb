require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる場合' do
      it '必要な情報が存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it '商品画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では保存できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'カテゴリーが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では保存できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it '配送料の負担が空では保存できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end

      it '発送元の地域が空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では保存できない' do
        @item.delivery_criterion_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery criterion can't be blank")
      end

      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数字でなければ保存できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格は数字でなければ保存できない' do
        @item.price = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '300円以下では保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '9,999,999以下でなければ保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end

