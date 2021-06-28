require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  
    before do 
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_info = FactoryBot.build(:order_info, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    describe '商品の購入情報の保存' do

      context '商品の購入記録が登録されるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_info).to be_valid
        end
      end

      context '商品の購入記録が保存できないとき' do
        it 'item_qtyを選択していないと保存できない' do
          @order_info.item_qty = 0
          @order_info.valid?
         expect(@order_info.errors.full_messages).to include "Item qty must be other than 0"
        end

        it 'payment_typeを選択していないと保存できない' do
          @order_info.payment_type = 0
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Payment type must be other than 0"
        end

        it 'received_typeを選択していないと保存できない' do
          @order_info.received_type = 0
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Received type must be other than 0"
        end

        it 'phoneが空だと保存できない' do
          @order_info.phone = ''
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Phone can't be blank"
        end

        it 'phoneが11桁以上では保存できない' do
          @order_info.phone = '090123456789'
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Phone is invalid"
        end

        it 'phoneにハイフンがあると保存できない' do
          @order_info.phone = '090-9876-5432'
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Phone is invalid"
        end

        it 'phoneに数値以外があると保存できない' do
          @order_info.phone = 'a9098765432'
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Phone is invalid"
        end

        it 'user情報が紐づいていないと保存できない' do
          @order_info.user_id = ''
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "User can't be blank"
        end

        it 'item情報が紐づいていないと保存できない' do
          @order_info.item_id = ''
          @order_info.valid?
          expect(@order_info.errors.full_messages).to include "Item can't be blank"
        end
      end
    end
end
