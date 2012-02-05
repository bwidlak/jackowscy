class CategoriesController < ApplicationController
  
  before_filter :load_categories, :except => [ :index ]
  before_filter :authenticate_user!, :except => [:index, :show, :dropdown_category]
  
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 11)
  end

  def show
    @category = Category.find_by_permalink(params[:id])
    @projects = @category.projects.paginate(:page => params[:page], :per_page => 11)
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def dropdown_category
    @category = Category.find_by_permalink(params[:category])
    redirect_to @category
  end
  
  def load_categories
    @categories = Category.all
  end
  
end
