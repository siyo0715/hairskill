class CutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cuts = current_user.cuts.page(params[:page]).per(10).order('updated_at DESC')
    @cut = Cut.new
  end

  def show
    @cut = current_user.cuts.find(params[:id])
  end

  def create
    @cut = current_user.cuts.new(cut_parameter)
    if @cut.save
      redirect_to cuts_path, notice: "投稿完了"
    else
      @cuts = current_user.cuts.page(params[:page]).per(10).order('updated_at DESC')
      render 'index'
    end
  end

  def destroy
    @cut = current_user.cuts.find(params[:id])
    @cut.destroy
    redirect_to cuts_path, notice: "削除完了"
  end

  def edit
    @cut = current_user.cuts.find(params[:id])
  end

  def update
    @cut = current_user.cuts.find(params[:id])
    if @cut.update(cut_parameter)
      redirect_to cuts_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def cut_parameter
  params.require(:cut).permit(:title, :detail, :evaluation, :cut_image).merge(user_id: current_user.id)
end
