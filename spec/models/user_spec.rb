# frozen_string_literal: true

  require 'rails_helper'

  RSpec.describe User, "Userモデルのテスト", type: :model do
    # describe 'バリデーションのテスト' do
    #   it "新規登録に必要な内容は保存されているか" do
    #     expect(FactoryBot.build(:user)).to be_valid
    #   end
    # end

     context "空白のバリデーションチェック" do
      it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(first_name:'hoge',last_name: '',phone_number:'hoge')
        expect(user).to be_invalid
        p user.errors
        p user.errors[:last_name]
        # "を入力してください" include(""を入力してください"")
        expect(user.errors[:last_name]).to include("を入力してください")
      end
      it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(first_name:'',last_name:'hoge',phone_number:'hoge')
        expect(user).to be_invalid
        expect(user.errors[:first_name]).to include("を入力してください")
      end
      it "phone_numberが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(first_name:'hoge',last_name:'hoge',phone_number:'')
        expect(user).to be_invalid
        expect(user.errors[:phone_number]).to include("を入力してください")
      end
     end
    end
#   context "first_nameカラム" do
#     it "空白でないこと" do
#       user.first_name = ""
#       is_expected.to eq false
#     end
#     it "1文字以上であること" do
#       user.first_name = ""
#       is_expected.to eq true
#     end
#     it "20文字以下であること"
#       user.first_name = ""
#       is_expected.to eq false
#     end