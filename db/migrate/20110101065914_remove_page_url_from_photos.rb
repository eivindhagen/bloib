class RemovePageUrlFromPhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :page_url
  end

  def self.down
    add_column :photos, :page_url, :text
  end
end
