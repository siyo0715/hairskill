class PermsController < ApplicationController
  before_action :authenticate_user!
  def index
    @perms = current_user.perms.page(params[:page]).per(10).order('updated_at DESC').search(params[:search])
    @perm = Perm.new
  end

  def show
    @perm = current_user.perms.find(params[:id])
  end

  def create
    @perm = current_user.perms.new(perm_parameter)
    if @perm.save
      redirect_to perms_path, notice: "投稿完了"
    else
      @perms = current_user.perms.page(params[:page]).per(10).order('updated_at DESC')
      render 'index'
    end
  end

  def destroy
    @perm = current_user.perms.find(params[:id])
    @perm.destroy
    redirect_to perms_path, notice: "削除完了"
  end

  def edit
    @perm = current_user.perms.find(params[:id])
  end

  def update
    @perm = current_user.perms.find(params[:id])
    if @perm.update(perm_parameter)
      redirect_to perms_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def perm_parameter
  params.require(:perm).permit(:title, :detail, :evaluation, :perm_image).merge(user_id: current_user.id)
end
