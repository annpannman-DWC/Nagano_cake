require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'Customerモデルのバリデーションチェック' do
    it "email, first_name, last_name, first_name_kana, last_name_kana, phone_number, address, postal_code, password が有効であること" do
      expect(build(:customer)).to be_valid
    end
    it "first_name が存在せず無効であること" do
      expect(build(:customer, first_name: nil)).not_to be_valid
    end
    it "emailが存在せず無効であること" do
      expect(build(:customer, email: nil)).not_to be_valid
    end
    it "emailが重複し無効であること" do
      create(:customer, email: "test@example.com")
      expect(build(:customer, email: "test@example.com")).not_to be_valid
    end
  end
  
  # 「自身で作成したメソッドなどをテストするのが大事です」らしい
  context "インスタンスメソッドチェック" do
    it "full_nameメソッドがフルネームを文字列で返すこと"do
      customer = build(:customer, last_name: "山田", first_name: "太郎")
      expect(customer.full_name).to eq "山田 太郎"
    end
  end
end
