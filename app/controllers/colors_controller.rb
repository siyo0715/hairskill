class ColorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @colors = current_user.colors.page(params[:page]).per(10).order('updated_at DESC').search(params[:search])
    @color = Color.new
  end

  def show
    @color = current_user.colors.find(params[:id])
  end

  def create
    @color = current_user.colors.new(color_parameter)
    if @color.save
      redirect_to colors_path, notice: "投稿完了"
    else
      @colors = current_user.colors.page(params[:page]).per(10).order('updated_at DESC')
      render 'index'
    end
  end

  def destroy
    @color = current_user.colors.find(params[:id])
    @color.destroy
    redirect_to colors_path, notice: "削除完了"
  end

  def edit
    @color = current_user.colors.find(params[:id])
  end

  def update
    @color = current_user.colors.find(params[:id])
    if @color.update(color_parameter)
      redirect_to colors_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def color_parameter
  params.require(:color).permit(:title, :detail, :evaluation, :color_image).merge(user_id: current_user.id)
end
