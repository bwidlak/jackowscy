class Image < ActiveRecord::Base

  belongs_to :project
  before_save :set_other_urls

  protected
  
  def set_other_urls
    return if img_url.blank?  
    base_url, ext = img_url.split('.jpg')
    self.square_url = [base_url, ext].join(square_ext) if square_url.blank?
    self.thumbnail_url = [base_url, ext].join(thumbnail_ext) if thumbnail_url.blank?
    self.small_url = [base_url, ext].join(small_ext) if small_url.blank?
    self.medium_url = [base_url, ext].join(medium_ext) if medium_url.blank?
    self.large_url = [base_url, ext].join(large_ext) if large_url.blank?
  end
    
  def square_ext #75x75
    '_s.jpg'
  end
  
  def thumbnail_ext #75x100
    '_t.jpg'
  end

  def small_ext #130x240
    '_m.jpg'
  end

  def medium_ext #480x640
    '_z.jpg'
  end

  def large_ext #768x1024
    '_b.jpg'
  end

end
