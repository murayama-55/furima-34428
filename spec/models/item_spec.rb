require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('app/assets/images/00.jpg')
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
     it '商品出品ページで全ての項目を入力すれば出品できる' do
      expect(@item).to be_valid
     end
    end

    context '商品が出品できないとき' do
     it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
     end
     it 'item_nameが空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
     end
     it 'infoが空では出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Info can't be blank"
     end
     it 'categoryが空では出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
     end
     it 'sales_statusが空では出品できない' do
      @item.sales_status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Sales status can't be blank"
     end
     it 'shipping_feeが空では出品できない' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
     end
     it 'prefectureが空では出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
     end
     it 'scheduleが空では出品できない' do
      @item.schedule_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Schedule can't be blank"
     end
     it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
     end
     it 'priceが299円以下では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 299"
     end
     it 'priceが10,000,000円以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 10000000"
     end
     it 'priceが全角数字では出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end
    end
  end
end
