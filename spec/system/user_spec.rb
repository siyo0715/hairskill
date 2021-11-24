# frozen_string_literal: true

require 'rails_helper'

describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) { build(:user) }

    context 'first_nameカラム' do
      it '空欄でないこと' do
        user.first_name = ''
        user.valid?
      end
      it '1文字以上であること:1は○' do
        user.first_name = Faker::Lorem.characters(number: 1)
        user.valid?
      end
      it '20文字以下であること:20は○' do
        user.first_name = Faker::Lorem.characters(number: 20)
        user.valid?
      end
      it '20文字以下であること:21は×' do
        user.first_name = Faker::Lorem.characters(number: 21)
        user.valid?
      end
    end

    context 'last_nameカラム' do
      it '空欄でないこと' do
        user.last_name = ''
        user.valid?
      end
      it '1文字以上であること:1は○' do
        user.last_name = Faker::Lorem.characters(number: 1)
        user.valid?
      end
      it '20文字以下であること:20は○' do
        user.last_name = Faker::Lorem.characters(number: 20)
        user.valid?
      end
      it '20文字以下であること:21は×' do
        user.last_name = Faker::Lorem.characters(number: 21)
        user.valid?
      end
    end

    context 'phone_numberカラム' do
      it '空欄でないこと' do
        user.phone_number = ''
        user.valid?
      end
      it '9文字以上であること:9は○' do
        user.phone_number = Faker::Lorem.characters(number: 9)
        user.valid?
      end
      it '9文字以上であること:8は×' do
        user.phone_number = Faker::Lorem.characters(number: 8)
        user.valid?
      end
      it '13文字以下であること:13は○' do
        user.phone_number = Faker::Lorem.characters(number: 13)
        user.valid?
      end
      it '13文字以下であること:14は×' do
        user.phone_number = Faker::Lorem.characters(number: 14)
        user.valid?
      end
    end
  end
end
