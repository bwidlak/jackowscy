class HomeController < ApplicationController

  def show
    @visible_projects = Project.home.recent.paginate(:page => params[:page], :per_page => 12)
    @count = @visible_projects.count
  end

end