class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params_valid)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  private
  def params_valid
    params.require(:blog).permit(:title, :content)
  end
end
