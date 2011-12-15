class Author < ActiveRecord::Base

  before_save :create_permalink

  has_many :projects
  has_many :blogs
  
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    "#{permalink}"
  end
  
  private

  def create_permalink
    self.permalink = name.to_url
  end

end
