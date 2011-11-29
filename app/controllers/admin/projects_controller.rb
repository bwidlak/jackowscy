class Admin::ProjectsController < ApplicationController

  layout 'admin'

  before_filter :load_categories, :only => [:new, :edit]
  before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @images = Project.find(params[:id]).images
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to admin_projects_url
      flash[:notice] = "Project was successfully created."
    else
      render action: "new"
      flash[:error] = @project.errors
    end
  end

  def update
    @project = Project.find(params[:id])
    params[:project][:category_ids] ||= []

    if @project.update_attributes(params[:project])
      redirect_to admin_project_url(@project)
      flash[:notice] = "Project was successfully updated."
    else
      render action: "edit"
      flash[:error] = "Errors while saving"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_url
  end
    
  def load_categories
    @categories = Category.all
  end
end
