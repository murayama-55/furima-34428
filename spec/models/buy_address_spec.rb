require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy_address,item_id: item.id,user_id: user.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it "全ての情報があれば保存できる" do
        expect(@buy).to be_valid
      end
      it "建物名が空でも保存できる" do
        @buy.building = ''
        expect(@buy).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it "tokenが空では保存できない" do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では保存できない" do
        @buy.post_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号はハイフン無しでは保存できない" do
        @buy.post_code = '1234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Post code is invalid")
      end
      it "都道府県が1では保存できない" do
        @buy.prefecture_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空では保存できない" do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では保存できない" do
        @buy.address = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では保存できない" do
        @buy.phone = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone can't be blank")
      end
      it "電話番号が英語では保存できない" do
        @buy.phone = 'aaabbb'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone is invalid")
      end
      it "電話番号が12桁以上では保存できない" do
        @buy.phone = '111111111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it "電話番号にハイフンを入れると保存できない" do
        @buy.phone = '090-1234-5678'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone is invalid")
      end
      it "user_idが存在しない場合は保存できない" do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが存在しない場合は保存できない" do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
  
end
