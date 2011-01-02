class RemovePublishFromPhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :publish
  end

  def self.down
    add_column :photos, :publish, :boolean
  end
end
