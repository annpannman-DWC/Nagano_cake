require 'rails_helper'

describe 'マスタ登録のテスト', type: :feature do
  let(:admin) { FactoryBot.create(:admin) }

  context "ログイン画面"  do
    it "メールアドレス・パスワードでログインすると管理者トップ画面が表示される" do
      visit new_admin_session_path
      fill_in "メールアドレス", with: "yamada@yamada"
      fill_in "パスワード", with: "abc123"
      click_button "ログイン"
      expect(page).to have_current_path(admin_path)
    end
  end

  context "管理者トップ画面" do
    before do
      login_as(admin, scope: :admin)
      visit admin_path
    end

    it "ヘッダからジャンル一覧へのリンクを押下するとジャンル一覧画面が表示される" do
      click_link "ジャンル"
      expect(page).to have_content "ジャンル一覧"
    end
  end

  context "ジャンル一覧画面" do
    before do
      login_as(admin, scope: :admin)
      visit admin_genres_path
    end

    it "必須事項を入力し、登録ボタンを押下したら、追加したジャンルが表示されているか" do
      fill_in "ジャンル名", with: "うんこ"
      click_button "新規登録"
      expect(page).to have_content "うんこ"
    end

    it "ヘッダーから商品一覧へのリンクを押下すると、商品一覧画面が表示される" do
      click_link "商品一覧"
      expect(page).to have_current_path(admin_items_path)
    end
  end

  context "商品一覧画面" do
    it "新規登録ボタンを押下すると、商品新規登録画面が表示される" do
      login_as(admin, scope: :admin)
      visit admin_items_path
      click_on "商品追加"
      expect(page).to have_current_path(new_admin_item_path)
    end
  end

  context "商品新規登録画面" do
    it "必要事項を入力して登録ボタンを押下すると、登録した商品の詳細画面に遷移する" do
      login_as(admin, scope: :admin)
      FactoryBot.create(:genre)
      visit new_admin_item_path
      fill_in "商品名", with: "うんち"
      fill_in "商品説明", with: "くさい"
      select "ケーキ", from: "ジャンル"
      fill_in "税抜価格", with: "931"
      click_button "新規登録"
      new_item_id = Item.last
      # クリックで生成されたid=Itemモデルの最後の数ってことだからこう書く
      # だから　new_item_id = Item.count + 1
      #       　click_button "新規登録"......とも書ける
      expect(page).to have_current_path(admin_item_path(new_item_id))
    end
  end
    
  context "商品詳細画面" do
    it "ヘッダーの商品一覧へのリンクを押下すると、商品一覧画面に遷移する" do
      login_as(admin, scope: :admin)
      FactoryBot.create(:item)
      visit "/admin/items/1"
      click_link "商品一覧"
      expect(page).to have_current_path(admin_items_path)
    end
  end
  
  context "商品一覧画面" do
    before do 
      login_as(admin, scope: :admin)
      FactoryBot.create(:item, name: "うんこ")
      visit admin_items_path
    end
    
    it "登録した商品が表示されている" do
      expect(page).to have_content "うんこ"
    end
    
    it "新規登録ボタンを押下すると商品新規登録画面が表示される" do
      click_on "商品追加"
      expect(page).to have_current_path(new_admin_item_path)
    end
  end
  
  context "商品新規登録画面" do
    it "必要事項を入力して登録ボタンを押下すると登録した商品の詳細画面に遷移する" do
      login_as(admin, scope: :admin)
      FactoryBot.create(:genre)
      visit new_admin_item_path
      fill_in "商品名", with: "うんち"
      fill_in "商品説明", with: "くさい"
      select "ケーキ", from: "ジャンル"
      fill_in "税抜価格", with: "931"
      new_item_id = Item.count + 1
      click_button "新規登録"
      expect(page).to have_current_path(admin_item_path(new_item_id))
    end
  end
  
  context "商品詳細画面" do
    it "ヘッダーの商品一覧へのリンクを押下すると、商品一覧画面に遷移する" do
      login_as(admin, scope: :admin)
      FactoryBot.create(:item)
      visit "/admin/items/1"
      click_link "商品一覧"
      expect(page).to have_current_path(admin_items_path)
    end
  end
  
  context "商品一覧画面" do
    before do 
      login_as(admin, scope: :admin)
      FactoryBot.create(:item, name: "アンパンマン")
      visit admin_items_path
    end
    
    it "登録した商品が表示されている" do
      expect(page).to have_content "アンパンマン"
    end
    
    it "ヘッダからログアウトボタンをクリックすると管理者ログイン画面に遷移する" do
      click_link "ログアウト"
      expect(page).to have_current_path(new_admin_session_path)
    end
  end
end