class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :filter_authors
  before_filter :set_locale
  before_filter :filter_categories
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def filter_categories
    @filter_main_categories = Category.find(:all, :conditions => { :visible => true })[0..3]
    @filter_sub_categories = Category.find(:all, :order => "name ASC") - @filter_main_categories
  end

  def filter_authors
    @authors = Author.find(:all, :order => "name ASC")
  end
  
end
