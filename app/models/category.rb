class Category < ActiveRecord::Base

  has_and_belongs_to_many :projects

  validates_presence_of :name
  validates_uniqueness_of :name
  
  before_save :create_permalink
  
  def to_param
    "#{permalink}"
  end
  
  private

  def create_permalink
    self.permalink = name.to_url
  end  
end
