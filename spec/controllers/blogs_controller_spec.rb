require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET /index" do
    it "responds successfully" do
      sign_in @user
      get :index
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきているか？" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end

    it "responds successfully" do
      get :index
      expect(response).not_to be_successful
    end

    it "301レスポンスが返ってきているか？" do
      get :index
      expect(response).to have_http_status "302"
    end
  end

  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      sign_in @user
      get :show, params: { id: @blog.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :show, params: { id: @blog.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :show, params: { id: @blog.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
      @blog = FactoryBot.create(:blog, user_id: @user.id)
    end
    it "正常に日程を作成できているか？" do
      sign_in @user
      post :create, params: { blog: {title: @blog.title, content: @blog.content, start_time: @blog.start_time } }
      expect(response).to redirect_to blogs_path
    end
  end
end
