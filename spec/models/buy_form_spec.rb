require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_form = FactoryBot.build(:buy_form, user_id: @user.id, item_id: @item.id)
    sleep 1
  end

  describe "商品購入機能" do
    context "商品購入がうまくいく時" do
      it "post_code,prefecture_id,city,house_number,phone_number,token,user_id,item_idが存在すれば登録できる" do
        expect(@buy_form).to be_valid
      end
      it "building_nameがあっても登録できる" do
        @buy_form.building_name = "建物名"
        expect(@buy_form).to be_valid
      end
    end

    context "商品購入がうまくいかない時" do
      it "post_codeが空だと登録できない" do
        @buy_form.post_code = ""
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Post code can't be blank"
      end
      it "post_codeにハイフンが入っていないと登録できない" do
        @buy_form.post_code = "1231234"
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Post code is invalid"
      end
      it "prefecture_idを選んでいないと登録できない" do
        @buy_form.prefecture_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Prefecture Select"
      end
      it "cityが空だと登録できない" do
        @buy_form.city = ""
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "City can't be blank"
      end
      it "house_numberが空だと登録できない" do
        @buy_form.house_number = ""
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "House number can't be blank"
      end
      it "phone_numberが空だと登録できない" do
        @buy_form.phone_number = ""
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it "phone_numberにハイフンが入っていると登録できない" do
        @buy_form.phone_number = "06-1234-1234"
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Phone number is invalid"
      end
      it "phone_numberが12桁以上だと登録できない" do
        @buy_form.phone_number = "061234123412"
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Phone number is invalid"
      end
      it "tokenが空だと登録できない" do
        @buy_form.token = ""
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Token can't be blank"
      end
      it "user.idが空だと登録できない" do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "User can't be blank"
      end
      it "item.idが空だと登録できない" do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Item can't be blank"
      end


    end
  end
end




