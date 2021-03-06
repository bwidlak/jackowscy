class AuthorsController < ApplicationController

  def show
    @author = Author.find_by_permalink(params[:id])
    @author_projects = @author.projects.paginate(:page => params[:page], :per_page => 11)
  end
  
  def dropdown_author
    @author = Author.find_by_permalink(params[:author])
    redirect_to @author
  end
  
end
