class CategoriesController < ApplicationController
  
  before_filter :load_categories, :except => [ :index ]
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 11)
  end

  def show
    @category = Category.find_by_permalink(params[:id])
    @projects = @category.projects
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def load_categories
    @categories = Category.all
  end
  
end
