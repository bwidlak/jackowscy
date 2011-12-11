class ProjectsController < ApplicationController

  before_filter :load_categories

  def index
    @projects = Project.paginate(:page => params[:page], :conditions => { :status => true })
  end

  def show
    @project = Project.find(params[:id])
    @images = Project.find(params[:id]).images
    @image = Project.find(params[:id]).images.first
    @other_projects = @project.author.projects.paginate(:page => params[:page], :conditions => ["id!='%s'", params[:id]], :per_page => 6)
  end

  def load_categories
    @categories = Category.find(:all, :conditions => { :visible => true })[0..7]
  end
end
