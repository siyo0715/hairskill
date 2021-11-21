# frozen_string_literal: true

require 'rails_helper'

  describe 'Permモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { perm.valid? }

    let(:perm) { build(:perm) }

    context 'titleカラム' do
      it '空欄でないこと' do
          perm.title = ''
          perm.valid?
      end
      it '1文字以上であること:1は○' do
          perm.title = Faker::Lorem.characters(number: 1)
          perm.valid?
      end
      it '20文字以下であること:20は○' do
          perm.title = Faker::Lorem.characters(number: 20)
          perm.valid?
      end
      it '20文字以下であること:21は×' do
          perm.title = Faker::Lorem.characters(number: 21)
          perm.valid?

      end
    end

    context 'detailカラム' do
      it '空欄でないこと' do
          perm.detail = ''
          perm.valid?
      end
      it '1文字以上であること:1は○' do
          perm.detail = Faker::Lorem.characters(number: 1)
          perm.valid?
      end
      it '500文字以下であること:500は○' do
          perm.detail = Faker::Lorem.characters(number: 500)
          perm.valid?
      end
      it '500文字以下であること:501は×' do
          perm.detail = Faker::Lorem.characters(number: 501)
          perm.valid?
      end
    end
    context 'evaluationカラム' do
      it '空欄でないこと' do
          perm.evaluation = ''
          perm.valid?
      end
    end
    context 'perm_imageカラム' do
      it '空欄でないこと' do
          perm.perm_image = ''
          perm.valid?
      end
    end
  end
end