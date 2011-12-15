class AddPermalinkToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :permalink, :string
  end

  def self.down
    remove_column :authors, :permalink
  end 
end
