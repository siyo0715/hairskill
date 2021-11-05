class PermsController < ApplicationController
  def index
    @perms = Perm.all
    @perm = Perm.new
  end

  def show
    @perm = Perm.find(params[:id])
  end

  def create
    Perm.create(perm_parameter)
    redirect_to perms_path, notice:"投稿完了"
  end

  def destroy
    @perm = Perm.find(params[:id])
    @perm.destroy
    redirect_to perms_path, notice:"削除完了"
  end

  def edit
    @perm = Perm.find(params[:id])
  end

  def update
    @perm = Perm.find(params[:id])
    if @perm.update(perm_parameter)
      redirect_to perms_path, notice: "編集完了"
    else
      render 'edit'
    end
  end
end

private

def perm_parameter
  params.require(:perm).permit(:title, :detail, :image)
end