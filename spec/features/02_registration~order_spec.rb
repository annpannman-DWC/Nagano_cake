require 'rails_helper'

RSpec.describe "Nagano_cake", type: :feature do
  let(:customer) { create(:customer) }


  describe "トップページ" do
    it "新規登録画面のリンクを押下すると新規登録画面が表示される" do
      visit root_path
      click_link "新規登録"
      expect(page).to have_current_path(new_customer_registration_path)
    end
  end

  describe "新規登録画面" do

    before do
      visit new_customer_registration_path
      fill_in '(姓)', with: "西"
      fill_in '(名)', with: "拓美"
      fill_in '(セイ)', with: "ニシ"
      fill_in '(メイ)', with: "タクミ"
      fill_in 'メールアドレス', with: "nissy@example.com"
      fill_in '郵便番号(ハイフンなし)', with: "2222222"
      fill_in '住所', with: "東京都足立区123-12-1"
      fill_in '電話番号(ハイフンなし)', with: "222222222"
      fill_in 'パスワード(６文字以上)', with: "taku210"
      fill_in 'パスワード(確認用)', with: "taku210"

      click_button "新規登録"
    end

    it "登録ボタンを押下するとマイページに遷移する" do
      expect(page).to have_current_path(customers_mypage_path)
    end

    it "新規登録画面で入力した情報が表示されている" do
      expect(page).to have_content("西")
      expect(page).to have_content("拓美")
      expect(page).to have_content("ニシ")
      expect(page).to have_content("タクミ")
      expect(page).to have_content("nissy@example.com")
      expect(page).to have_content("2222222")
      expect(page).to have_content("東京都足立区123-12-1")
      expect(page).to have_content("222222222")
    end

    it "ヘッダーがログイン後の表示に代わっている" do
      expect(page).to have_link("マイページ")
      expect(page).to have_link("商品一覧")
      expect(page).to have_link("カート")
      expect(page).to have_link("ログアウト")
    end
  end

  describe "マイページ" do
    it "ヘッダーのロゴ画像を押下するとトップ画面に遷移する" do
      visit customers_mypage_path
      click_link "Logo"
      expect(page).to have_current_path(root_path)
    end
  end

  describe "トップ画面" do
  let!(:item) { FactoryBot.create(:item) }

    before do
      visit root_path
    end

    it "任意の商品画像を押下すると該当商品の詳細画面に遷移する" do
      click_link "商品画像" # 商品名をリンクテキストとしてクリックする
      expect(page).to have_current_path(item_path(item.id))
    end

    it "商品情報が正しく表示されている" do
      expect(page).to have_content(item.name)
      expect(page).to have_content((item.price * 1.1).floor)
    end
  end

  describe "商品詳細画面" do
    let!(:item) { create(:item) }
    # let(:cart_item) { FactoryBot.create(:cart_item, item: item, customer: customer) }

    it "個数を選択し、カートに入れるボタンを押下するとカート画面に遷移する" do
      login_as(customer, scope: :customer)
      visit item_path(item.id)
      select "5個", from: "cart_item[amount]"
      click_button "カートに入れる"
      expect(page).to have_current_path(cart_items_path)
    end

    it "カートの中身が正しく表示されている" do
      login_as(customer, scope: :customer)
      cart_item = FactoryBot.create(:cart_item, item: item, customer: customer)
      visit cart_items_path
      expect(page).to have_content(cart_item.item.name)
      expected_price = (cart_item.item.price * 1.1).floor.to_s(:delimited)
      expect(page).to have_content(expected_price)
    end
  end
  
  describe "カート画面" do
    let!(:item) { create(:item) }
    let!(:cart_item) { FactoryBot.create(:cart_item, item: item, customer: customer) }
    
    before do
      login_as(customer, scope: :customer)
      visit cart_items_path
    end
    
    # it "カートの中身が正しく表示されている" do
    #   expect(page).to have_content(cart_item.item.name)
    #   # expected_price = expected_price = (cart_item.item.price * 1.1).floor.to_i.to_s(:delimited)
    #   expect(page).to have_content(number_to_currency(cart_item.item.price * 1.1, unit: "円", format: "%n%u", precision: 0))

    # end
    
    # it "商品の個数を変更し、更新ボタンを押下すると、合計表示が正しく表示されるか" do
    #   within(".cart-item-#{cart_item.id}") do
    #     fill_in "cart_item[amount]", with: 3
    #     click_button "変更"
    #   end
    #   updated_price = (item.price * 1.1 * 3).floor.to_s(:delimited)
    #   expect(page).to have_content(updated_price)
    # end
  end

end