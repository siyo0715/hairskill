require 'rails_helper'

  describe 'Colorモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { color.valid? }

    let(:color) { build(:color) }

    context 'titleカラム' do
      it '空欄でないこと' do
          color.title = ''
          color.valid?
      end
      it '1文字以上であること:1は○' do
          color.title = Faker::Lorem.characters(number: 1)
          color.valid?
      end
      it '20文字以下であること:20は○' do
          color.title = Faker::Lorem.characters(number: 20)
          color.valid?
      end
      it '20文字以下であること:21は×' do
          color.title = Faker::Lorem.characters(number: 21)
          color.valid?
      end
    end

    context 'detailカラム' do
      it '空欄でないこと' do
          color.detail = ''
          color.valid?
      end
      it '1文字以上であること:1は○' do
          color.detail = Faker::Lorem.characters(number: 1)
          color.valid?
      end
      it '500文字以下であること:500は○' do
          color.detail = Faker::Lorem.characters(number: 500)
          color.valid?
      end
      it '500文字以下であること:501は×' do
          color.detail = Faker::Lorem.characters(number: 501)
          color.valid?
      end
    end
    context 'evaluationカラム' do
      it '空欄でないこと' do
          color.evaluation = ''
          color.valid?
      end
    end
    context 'color_imageカラム' do
      it '空欄でないこと' do
          color.color_image = ''
          color.valid?
      end
    end
  end
end