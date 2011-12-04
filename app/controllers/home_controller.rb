class HomeController < ApplicationController

  def show
    @visible_projects = Project.paginate(:page => params[:page], :conditions => { :status => true, :home => true }, :per_page=> 12)
  end

end