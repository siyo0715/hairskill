class ColorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @colors = Color.all
    @color = Color.new
  end

  def show
    @color = Color.find(params[:id])
  end

  def create
    @color = Color.new(color_parameter)
    if @color.save
      redirect_to colors_path, notice:"投稿完了"
    else
      @color = Color.all
      render 'index'
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to colors_path, notice:"削除完了"
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    if @color.update(color_parameter)
      redirect_to colors_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def color_parameter
  params.require(:color).permit(:title, :detail, :color_image).merge(user_id: current_user.id)
end
