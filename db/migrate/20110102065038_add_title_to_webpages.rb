class AddTitleToWebpages < ActiveRecord::Migration
  def self.up
    add_column :webpages, :title, :text
  end

  def self.down
    remove_column :webpages, :title
  end
end
