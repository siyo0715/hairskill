# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Perm, "Permモデルのテスト", type: :model do
  let(:perm) { build(:perm) }

  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      perm.title = ''
      expect(perm).to be_invalid
      expect(perm.errors[:title]).to include("を入力してください")
    end
    it "detailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      perm.detail = ''
      expect(perm).to be_invalid
      expect(perm.errors[:detail]).to include("を入力してください")
    end
    it "evaluationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      perm.evaluation = ''
      expect(perm).to be_invalid
      expect(perm.errors[:evaluation]).to include("を入力してください")
    end
    it "perm_imageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      perm.perm_image = ''
      expect(perm).to be_invalid
      expect(perm.errors[:perm_image]).to include("を入力してください")
    end
  end
end
