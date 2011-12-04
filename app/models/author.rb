class Author < ActiveRecord::Base

  has_many :projects
  has_many :blogs
  
  validates_presence_of :name
  validates_uniqueness_of :name

end
