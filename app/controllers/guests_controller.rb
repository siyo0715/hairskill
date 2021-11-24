class GuestsController < ApplicationController
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = 'テスト'
      user.last_name = '太郎'
      user.phone_number = '030-1234-xxxx'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
