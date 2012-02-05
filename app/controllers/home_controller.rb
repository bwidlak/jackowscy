class HomeController < ApplicationController

  def show
    @visible_projects = Project.paginate(:page => params[:page], :per_page => 12, :conditions => {:status => true, :home => true}).order("updated_at DESC")
  end

end