class ImagesController < ApplicationController

  before_filter :load_projects

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end
  
  def load_projects
    @project = Project.find_by_id(params[:project_id])
  end
  
end
