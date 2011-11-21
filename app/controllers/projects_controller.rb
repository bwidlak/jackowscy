class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @images = Project.find(params[:id]).images
    @image = Project.find(params[:id]).images.first
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def edit
    @project = Project.find(params[:id])
    @categories = Category.all
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project
      flash[:notice] = "Project was successfully created."
    else
      render action: "new"
      flash[:error] = @project.errors
    end
  end

  def update
    @project = Project.find(params[:id])
    params[:project][:category_ids] ||= []


    respond_to do |format|
      if @project.update_attributes(params[:project])
        redirect_to @project
        flash[:notice] = "Project was successfully updated."
      else
        render action: "edit"
        flash[:error] = "Errors while saving"
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end
end
