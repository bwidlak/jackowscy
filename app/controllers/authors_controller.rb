class AuthorsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @author_projects = @author.projects
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        redirect_to @author
        flash[:notice] = "Author was successfully created."
      else
        render action: "new"
      end
    end
  end

  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        redirect_to @author
        flash[:notice] = 'Author was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
  end
end
