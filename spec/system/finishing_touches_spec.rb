require 'rails_helper'

describe ' 仕上げのテスト' do
  let!(:user) { create(:user) }
  let!(:cut) { create(:cut, user: user) }
  let!(:color) { create(:color, user: user) }
  let!(:perm) { create(:perm, user: user) }
  let!(:blog) { create(:blog, user: user) }
  let!(:contact) { create(:contact)}
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
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

  # it 'ユーザログイン成功時' do
  #   visit new_user_session_path
  #   fill_in 'user[email]', with: Faker::Internet.email
  #   fill_in 'user[password]', with: 'password'
  #   click_button 'Log in'
  #   is_expected.to have_content 'ログインしました!'
  # end
  
end