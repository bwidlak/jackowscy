class AddAuthorIdAndPriceToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :author_id, :integer
    add_column :projects, :price, :float
  end
  
  def self.down
    remove_column :projects, :author_id
    remove_column :projects, :price
  end
end
