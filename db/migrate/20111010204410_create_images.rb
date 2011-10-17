class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :project_id
      t.string :img_url
      t.boolean :status

      t.timestamps
    end
  end
  
  def self.up
    drop_table :images
  end
end
