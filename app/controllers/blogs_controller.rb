class BlogsController < ApplicationController
  
  before_action :find_blogs, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.save
    
    if @blog.save
      flash[:notice] = "Your post created successfully."
      redirect_to @blog
    else 
      flash[:alert] = "You post can not be created."
      render "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update    
    @blog.update(blog_params)
    
    if @blog.save
      flash[:notice] = "Your post update successfully."
      redirect_to @blog
    else 
      flash[:alert] = "You post can not be updated."
      render "new"
    end
  end
  
  def destroy    
    @blog.destroy
    
    redirect_to blogs_path
  end
  
  private
  
  def find_blogs
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end