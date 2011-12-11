class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @author_projects = @author.projects
  end

end
