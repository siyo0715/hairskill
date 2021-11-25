require 'rails_helper'

RSpec.describe CutsController, type: :controller do
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
      @cut = FactoryBot.create(:cut, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: { id: @cut.id }
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      sign_in @user
      get :show, params: { id: @cut.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :show, params: { id: @cut.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :show, params: { id: @cut.id }
      expect(response).to have_http_status "302"
    end
  end

  describe "#create" do
    before do
      @user = FactoryBot.create(:user)
      @cut = FactoryBot.create(:cut, user_id: @user.id)
    end
    # it "正常に日程を作成できているか？" do
    #   sign_in @user
    #   post :create, params: { cut: {title: @cut.title, detail: @cut.detail, evaluation: @cut.evaluation, cut_image: @cut.cut_image} }
    #   expect(response).to redirect_to cuts_path
    # end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @cut = FactoryBot.create(:cut, user_id: @user.id)
    end

    it "responds successfully" do
      sign_in @user
      get :edit, params: { id: @cut.id }
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      sign_in @user
      get :edit, params: { id: @cut.id }
      expect(response).to have_http_status "200"
    end
    it "responds successfully" do
      get :edit, params: { id: @cut.id }
      expect(response).not_to be_successful
    end
    it "301レスポンスが返ってきているか？" do
      get :edit, params: { id: @cut.id }
      expect(response).to have_http_status "302"
    end
  end

   describe "#destroy" do
    before do
      @user = FactoryBot.create(:user)
      @cut = FactoryBot.create(:cut, user_id: @user.id)
    end
    context "正常に記事を削除できるか？" do
      it "deletes an cut" do
        sign_in @user
        expect {
          delete :destroy, params: {id: @cut.id}
        }.to change(@user.cuts, :count).by(-1)
      end
      it "投稿を削除した後、ルートページへリダイレクトしているか？" do
        sign_in @user
        delete :destroy, params: {id: @cut.id}
        expect(response).to redirect_to cuts_path
      end
    end
  end
end
