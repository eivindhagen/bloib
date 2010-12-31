class DeleteClipUrlFromPhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :clip_url
  end

  def self.down
    add_column :photos, :clip_url, :text
  end
end
