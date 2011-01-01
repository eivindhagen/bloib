class AddWebpageIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :webpage_id, :integer
  end

  def self.down
    remove_column :photos, :webpage_id
  end
end
