class AddChecksumsToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :md5, :string
    add_column :photos, :sha1, :string
  end

  def self.down
    remove_column :photos, :sha1
    remove_column :photos, :md5
  end
end
