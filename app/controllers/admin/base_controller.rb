class Admin::BaseController < ApplicationController

  layout 'admin'
  before_filter :authenticate_user!
  
  def index
  end
  
end
