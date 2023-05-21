RSpec.describe "Admin", type: :request do
  describe "GET /admin/dashboard" do
    it "returns the dashboard page for authenticated admin" do
      admin = Admin.create(email: 'mario@mario', password: 'aaaaaa')
      sign_in admin

      get "/admin/dashboard"
      expect(response).to have_http_status(200)
      # 以下、テストの実行コードを追加します
    end
  end
end