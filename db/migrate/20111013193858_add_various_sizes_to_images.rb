class AddVariousSizesToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :square_url, :string
    add_column :images, :thumbnail_url, :string
    add_column :images, :small_url, :string
    add_column :images, :medium_url, :string
    add_column :images, :large_url, :string
  end
  
  def self.down
    remove_column :images, :square_url
    remove_column :images, :thumbnail_url
    remove_column :images, :small_url
    remove_column :images, :medium_url
    remove_column :images, :large_url
  end
end
