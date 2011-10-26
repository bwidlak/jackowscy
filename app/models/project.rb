class Project < ActiveRecord::Base

  has_many :images
  belongs_to :author
  has_and_belongs_to_many :categories
  
  validates_presence_of :name
  validates_presence_of :author
  
  before_destroy :find_and_delete_all_assertions
  
  self.per_page = 10

  def only_visible
  end

  def find_and_delete_all_assertions
    self.images.destroy_all
  end

end
