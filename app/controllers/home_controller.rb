class HomeController < ApplicationController

  def show
    @visible_projects = Project.paginate(:page => params[:page], :conditions => { :status => true, :home => true }, :per_page=> 12)
    @categories = Category.find(:all, :conditions => { :visible => true })[0..7]
  end

end