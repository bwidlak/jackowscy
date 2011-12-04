class Admin::BlogsController < ApplicationController

  layout 'admin'
  
  before_filter :load_blogs
  before_filter :authenticate_user!
  
  def index
  end
  
  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      redirect_to admin_blogs_url
      flash[:notice] = 'Blog was successfully created.'
    else
      render action: "new"
      flash[:error] = @blog.errors
    end
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      redirect_to admin_blogs_url
      flash[:notice] = 'Blog was successfully updated.'
    else
      render action: "edit"
      flash[:error] = @blog.errors
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_url
  end
  
  def load_blogs
    @blogs = Blog.find(:all, :order => "created_at DESC")
  end
end
