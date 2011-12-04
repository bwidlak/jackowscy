class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :filter_categories
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def filter_categories
    @filter_categories = Category.find(:all, :conditions => { :visible => true })[0..7]
  end
  
end
