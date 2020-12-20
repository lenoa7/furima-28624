require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email:"aaa@ggmail.com",password: "a123456" , password_confirmation: "a123456", first_name: "山田",first_name_kana: "ヤマダ",last_name: "太郎", last_name_kana: "タロウ",birth_date:"1930-01-01")
      user.valid?
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email:"",password: "a123456" , password_confirmation: "a123456", first_name: "山田",first_name_kana: "ヤマダ",last_name: "太郎", last_name_kana: "タロウ",birth_date:"1930-01-01")
      user.valid?
      binding.pry
    end
  end
end
