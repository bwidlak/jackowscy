class Admin::CategoriesController < ApplicationController

  layout 'admin'

  before_filter :load_categories
  before_filter :authenticate_user!

  def index
  end

  def show
    @category = Category.find_by_permalink(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by_permalink(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to admin_categories_url
      flash[:notice] = "Category was successfully created."
    else
      render action: "new"
      flash[:error] = @category.errors
    end
  end

  def update
    @category = Category.find_by_permalink(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to admin_categories_url
      flash[:notice] = 'Category was successfully updated.'
    else
      render action: "edit"
      flash[:error] = @category.errors
    end
  end

  def destroy
    @category = Category.find_by_permalink(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end
  
  def load_categories
    @categories = Category.all
  end
end
