class ColorsController < ApplicationController
  def index
    @colors = Color.all
    @color = Color.new
  end

  def show
    @color = Color.find(params[:id])
  end

  def create
    Color.create(color_parameter)
    redirect_to colors_path, notice:"投稿完了"
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
  params.require(:color).permit(:title, :detail, :image)
end
