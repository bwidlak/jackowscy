class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @author_projects = @author.projects.paginate(:page => params[:page], :per_page => 11)
  end

end
