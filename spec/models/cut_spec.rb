# frozen_string_literal: true

  require 'rails_helper'

  RSpec.describe Cut, "Cutモデルのテスト", type: :model do

     let(:cut) { build(:cut) }
     context "空白のバリデーションチェック" do
      it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        cut.title = ''
        expect(cut).to be_invalid
        expect(cut.errors[:title]).to include("を入力してください")
      end
      it "detailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        cut.detail = ''
        expect(cut).to be_invalid
        expect(cut.errors[:detail]).to include("を入力してください")
      end
      it "evaluationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        cut.evaluation = ''
        expect(cut).to be_invalid
        expect(cut.errors[:evaluation]).to include("を入力してください")
      end
      it "cut_imageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        cut.cut_image = ''
        expect(cut).to be_invalid
        expect(cut.errors[:cut_image]).to include("を入力してください")
      end
     end
    end