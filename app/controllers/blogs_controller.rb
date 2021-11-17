class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = current_user.blogs
    @blog = Blog.new
  end

  def show
    @blog = current_user.blogs.find(params[:id])
  end

  def create
    @blog = current_user.blogs.create(blog_parameter)
    redirect_to blogs_path
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "削除完了"
  end

  def edit
    @blog = current_user.blogs.find(params[:id])
  end

  def update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集完了"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
