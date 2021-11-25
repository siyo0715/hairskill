require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  describe "GET /information" do
    it "responds successfully" do
      sign_in @user
      get :information
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきているか？" do
      sign_in @user
      get :information
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :information
      expect(response).not_to be_successful
    end

    it "301レスポンスが返ってきているか？" do
      get :information
      expect(response).to have_http_status "302"
    end
  end

  describe "GET /skill" do
    it "responds successfully" do
      sign_in @user
      get :skill
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきているか？" do
      sign_in @user
      get :skill
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :skill
      expect(response).not_to be_successful
    end

    it "301レスポンスが返ってきているか？" do
      get :skill
      expect(response).to have_http_status "302"
    end
  end
end