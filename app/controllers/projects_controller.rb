class ProjectsController < ApplicationController

  before_filter :load_categories

  def index
    @projects = Project.recent.paginate(:page => params[:page], :per_page => 11)
  end

  def show
    @project = Project.recent.find_by_permalink(params[:id])
    @images = @project.images
    @image = @project.images.first
    @other_projects = @project.author.projects.paginate(:page => params[:page], :conditions => ["permalink!='%s'", params[:id]], :per_page => 6)
  end

  def load_categories
    @categories = Category.find(:all, :conditions => { :visible => true })[0..7]
  end
    
end
