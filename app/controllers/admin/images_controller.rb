class Admin::ImagesController < ApplicationController

  layout 'admin'

  before_filter :load_projects
  before_filter :authenticate_user!

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(params[:image])
    @image.project = @project

    if @image.save
      redirect_to admin_project_url(@project)
      flash[:notice] = "Successfully created..."
    else
      flash[:error] = @image.errors
    end
  end

  def update
    @image = Image.find(params[:id])
    
    if @image.update_attributes(params[:image])
      redirect_to admin_project_url(@project)
      flash[:notice] = "Successfully created..."
    else
      flash[:error] = @image.errors
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_project_url(@project)
  end

  def load_projects
    @project = Project.find_by_permalink(params[:project_id])
  end
end
