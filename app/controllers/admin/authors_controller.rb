class Admin::AuthorsController < ApplicationController

  layout 'admin'

  before_filter :load_authors
  before_filter :authenticate_user!

  def index
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(params[:author])

    if @author.save
      redirect_to admin_authors_url
      flash[:notice] = "Author was successfully created."
    else
      render action: "new"
      flash[:error] = @author.errors
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to admin_authors_url
      flash[:notice] = 'Author was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to admin_authors_url
  end
  
  def load_authors
    @authors = Author.all
  end
end
