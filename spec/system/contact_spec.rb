# frozen_string_literal: true

require 'rails_helper'

describe 'Contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { contact.valid? }

    let(:contact) { build(:contact) }

    context 'nameカラム' do
      it '空欄でないこと' do
        contact.name = ''
        contact.valid?
      end
      it '1文字以上であること:1は○' do
        contact.name = Faker::Lorem.characters(number: 1)
        contact.valid?
      end
      it '20文字以下であること:20は○' do
        contact.name = Faker::Lorem.characters(number: 15)
        contact.valid?
      end
      it '20文字以下であること:21は×' do
        contact.name = Faker::Lorem.characters(number: 16)
        contact.valid?
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        contact.email = ''
        contact.valid?
      end
      it '1文字以上であること:1は○' do
        contact.email = Faker::Lorem.characters(number: 1)
        contact.valid?
      end
      it '20文字以下であること:20は○' do
        contact.email = Faker::Lorem.characters(number: 50)
        contact.valid?
      end
      it '20文字以下であること:21は×' do
        contact.email = Faker::Lorem.characters(number: 51)
        contact.valid?
      end
    end

    context 'subjectカラム' do
      it '空欄でないこと' do
        contact.subject = ''
        contact.valid?
      end
      it '1文字以上であること:1は○' do
        contact.subject = Faker::Lorem.characters(number: 1)
        contact.valid?
      end
      it '11文字以下であること:11は○' do
        contact.subject = Faker::Lorem.characters(number: 11)
        contact.valid?
      end
      it '11文字以下であること:12は×' do
        contact.subject = Faker::Lorem.characters(number: 12)
        contact.valid?
      end
    end

    context 'messageカラム' do
      it '空欄でないこと' do
        contact.message = ''
        contact.valid?
      end
      it '9文字以上であること:9は○' do
        contact.message = Faker::Lorem.characters(number: 1)
        contact.valid?
      end
      it '200文字以下であること:200は○' do
        contact.message = Faker::Lorem.characters(number: 200)
        contact.valid?
      end
      it '200文字以下であること:201は×' do
        contact.message = Faker::Lorem.characters(number: 201)
        contact.valid?
      end
    end
  end
end
