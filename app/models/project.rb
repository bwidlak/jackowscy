class Project < ActiveRecord::Base

  before_save :create_permalink
  before_destroy :find_and_delete_all_assertions

  has_many :images
  belongs_to :author
  has_and_belongs_to_many :categories
  
  validates_presence_of :name
  validates_presence_of :author
  
  self.per_page = 10

  def only_visible
  end

  def find_and_delete_all_assertions
    self.images.destroy_all
  end

  def to_param
    "#{permalink}"
  end
  
  private

  def create_permalink
    self.permalink = name.to_url
  end

end
