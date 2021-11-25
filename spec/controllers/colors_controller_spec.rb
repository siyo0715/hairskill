require 'rails_helper'

RSpec.describe ColorsController, type: :controller do
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
      @color = FactoryBot.create(:color, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: { id: @color.id }
      expect(response).to be_successful
    end
    it "returns a 200レスポンスが返ってきているか？" do
      sign_in @user
      get :show, params: { id: @color.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :show, params: { id: @color.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :show, params: { id: @color.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
      @color = FactoryBot.create(:color, user_id: @user.id)
    end
    it "正常に投稿を作成できているか？" do
      sign_in @user
      post :create, params: { color: {title: @color.title, detail: @color.detail, evaluation: @color.evaluation, color_image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png'), 'image/png')} }
      expect(response).to redirect_to colors_path
    end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @color = FactoryBot.create(:color, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :edit, params: { id: @color.id }
      expect(response).to be_successful
    end
    it "returns a 200レスポンスが返ってきているか？" do
      sign_in @user
      get :edit, params: { id: @color.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :edit, params: { id: @color.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :edit, params: { id: @color.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#destroy" do
    before do
      @user = FactoryBot.create(:user)
      @color = FactoryBot.create(:color, user_id: @user.id)
    end
    context "正常に投稿を削除できるか？" do
      it "deletes an color" do
        sign_in @user
        expect {
          delete :destroy, params: {id: @color.id}
        }.to change(@user.colors, :count).by(-1)
      end
      it "投稿を削除した後、ルートページへリダイレクトしているか？" do
        sign_in @user
        delete :destroy, params: {id: @color.id}
        expect(response).to redirect_to colors_path
      end
    end
  end
end
