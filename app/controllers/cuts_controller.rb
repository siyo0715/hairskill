class CutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cuts = Cut.all
    @cut = Cut.new
  end

  def show
    @cut = Cut.find(params[:id])
  end

  def create
    @cut = Cut.new(cut_parameter)
    if @cut.save
      redirect_to cuts_path, notice:"投稿完了"
    else
      @cuts = Cut.all
      render 'index'
    end
  end

  def destroy
    @cut = Cut.find(params[:id])
    @cut.destroy
    redirect_to cuts_path, notice:"削除完了"
  end

  def edit
    @cut = Cut.find(params[:id])
  end

  def update
    @cut = Genre.find(params[:id])
    if @cut.update(cut_parameter)
      redirect_to cuts_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def cut_parameter
  params.require(:cut).permit(:title, :detail, :cut_image).merge(user_id: current_user.id)
end