require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できるとき' do

      it '全ての項目が記入されていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字である場合、出品できる' do
        @item.price = 11111
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not a number"
      end

      it 'priceが半角数字でないと出品できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'priceが半角かつ数字でないと出品できない' do
        @item.price = '１１１１あ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      it 'priceが¥1~¥9,999,999の間でないと、出品できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 1"
      end
      
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'category_nameが空では出品できない' do
        @item.category_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category name can't be blank"
      end

      it 'category_statusが空では出品できない' do
        @item.category_status = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category status can't be blank"
      end
    end
  end
end
