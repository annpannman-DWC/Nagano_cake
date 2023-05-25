require 'rails_helper'

RSpec.describe "Nagano_cake", type: :feature do
  describe "トップページ" do
    it "新規登録画面のリンクを押下すると新規登録画面が表示される" do
      visit root_path
      click_link "新規登録"
      expect(page).to have_current_path(new_customer_registration_path)
    end
  end

  describe "新規登録画面" do
    let(:customer) { create(:customer) }

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

  # describe "トップ画面" do
  #   let(:item) { create(:item, id: 1, name: "Sample Item", caption: "Sample Caption", price: 1000, is_active: true, genre_id: 1) }
    
  #   before do
  #     visit root_path
  #   end
    
  #   it "任意の商品画像を押下すると該当商品の詳細画面に遷移する" do
  #     click_link(item.name) # 商品名をリンクテキストとしてクリックする
  #   expect(page).to have_current_path(item_path(item))
  #   end
  # end
end