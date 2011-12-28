class HomeController < ApplicationController

  def show
    @visible_projects = Project.paginate(:page => params[:page])
  end

end