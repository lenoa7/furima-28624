require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品新規登録" do
    context '商品新規登録がうまくいくとき' do
      it "image,name,introduce,category,condition,delivery_fee,prefecture,delivery_days,priceが存在すれば登録できる" do
          expect(@item).to be_valid
      end
    end

    context '商品新規登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it "introduceが空だと登録できない" do
        @item.introduce = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduce can't be blank"
      end

      it "categryを選んでいないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end

      it "conditionを選んでいないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition Select"
      end

      it "delivery_feeを選んでいないと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee Select"
      end

      it "prefectureを選んでいないと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end

      it "delivery_daysを選んでいないと登録できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery days Select"
      end

      it "delivery_daysを選んでいないと登録できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery days Select"
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "priceが全角数字だと登録できない" do
        @item.price = "７００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it "priceに記号が含まれていると登録できない" do
        @item.price = "#$%54"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it "priceが300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it "priceが9999999超過だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end


    end

  end

end
