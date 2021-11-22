require 'rails_helper'

describe '[STEP3] 仕上げのテスト' do
  let(:user) { create(:user) }
end

describe 'サクセスメッセージのテスト' do
  subject { page }
  it 'ユーザ新規登録成功時' do
    visit new_user_registration_path
    fill_in 'user[first_name]', with: Faker::Lorem.characters(number: 20)
    fill_in 'user[last_name]', with: Faker::Lorem.characters(number: 20)
    fill_in 'user[phone_number]', with: Faker::Lorem.characters(number: 13)
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    is_expected.to have_content '新規登録完了'
  end
end