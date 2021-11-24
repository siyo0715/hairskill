require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET /index" do
    it "responds successfully" do
      sign_in @user
      get :index
      expect(response).to be_success
    end
    it "200レスポンスが返ってきているか？" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end

    it "responds successfully" do
      get :index
      expect(response).not_to be_success
    end

    it "301レスポンスが返ってきているか？" do
      get :index
      expect(response).to have_http_status "302"
    end
  end

  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to be_success
    end
    it "returns a 200 response" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to have_http_status "200"
    end
  end
end
