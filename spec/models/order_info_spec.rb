require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '商品の購入情報の保存' do
    before do 
      user = FactoryBot.create(:user)
      @order_info = FactoryBot.build(:order_info, user_id: user.id)
    end

    context '商品の購入記録が登録されるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '商品の購入記録が保存できないとき' do
      it 'item_qtyを選択していないと保存できない' do
      end
      it 'payment_typeを選択していないと保存できない' do
      end
      it 'received_typeを選択していないと保存できない' do
      end
      it 'phoneが空だと保存できない' do
      end
      it 'phoneが11桁以上では保存できない' do
      end
      it 'phoneにハイフンがあると保存できない' do
      end
      it 'phoneに数値以外があると保存できない' do
      end
      it 'userが紐づいていないと保存できない' do
      end

    end
  end
end
