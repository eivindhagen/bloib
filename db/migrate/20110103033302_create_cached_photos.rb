class CreateCachedPhotos < ActiveRecord::Migration
  def self.up
    create_table :cached_photos do |t|
      t.integer :photo_id
      t.integer :width
      t.integer :height
      t.string :filename
      t.string :md5
      t.string :sha1

      t.timestamps
    end
  end

  def self.down
    drop_table :cached_photos
  end
end
