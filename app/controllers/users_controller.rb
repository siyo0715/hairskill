class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def information
    @user = current_user
  end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :phone_number)
end
