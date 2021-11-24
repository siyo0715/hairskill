# frozen_string_literal: true

require 'rails_helper'

describe 'Cutモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { cut.valid? }

    let(:cut) { build(:cut) }

    context 'titleカラム' do
      it '空欄でないこと' do
        cut.title = ''
        cut.valid?
      end
      it '1文字以上であること:1は○' do
        cut.title = Faker::Lorem.characters(number: 1)
        cut.valid?
      end
      it '20文字以下であること:20は○' do
        cut.title = Faker::Lorem.characters(number: 20)
        cut.valid?
      end
      it '20文字以下であること:21は×' do
        cut.title = Faker::Lorem.characters(number: 21)
        cut.valid?
      end
    end

    context 'detailカラム' do
      it '空欄でないこと' do
        cut.detail = ''
        cut.valid?
      end
      it '1文字以上であること:1は○' do
        cut.detail = Faker::Lorem.characters(number: 1)
        cut.valid?
      end
      it '500文字以下であること:500は○' do
        cut.detail = Faker::Lorem.characters(number: 500)
        cut.valid?
      end
      it '500文字以下であること:501は×' do
        cut.detail = Faker::Lorem.characters(number: 501)
        cut.valid?
      end
    end

    context 'evaluationカラム' do
      it '空欄でないこと' do
        cut.evaluation = ''
        cut.valid?
      end
    end

    context 'cut_imageカラム' do
      it '空欄でないこと' do
        cut.cut_image = ''
        cut.valid?
      end
    end
  end
end
