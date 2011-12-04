class BlogsController < ApplicationController

  def index
    @blogs = Blog.find(:all, :conditions => {:active => true})
  end

  def show
    @blog = Blog.find(params[:id])
  end

end
