require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end

  describe '配送先情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode = '3001111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it '都道府県を選択していないと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県に「---」が選択されている場合は出品できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角数字だと保存できないこと' do
        @order_address.phone_number = '１１１２２２２３３３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end

      it '電話番号が９桁未満では保存できないこと' do
        @order_address.phone_number = '111222233'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter between 10 and 11 digits')
      end

      it '電話番号が１１桁を超過すると保存できないこと' do
        @order_address.phone_number = '111122223333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter between 10 and 11 digits')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
