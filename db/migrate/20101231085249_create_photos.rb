class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :title
      t.text :body
      t.text :photo_url
      t.text :page_url
      t.text :clip_url
      t.boolean :publish

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
