class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
      t.string :title
      t.text :body
      t.text :url

      t.timestamps
    end
  end

  def self.down
    drop_table :publishers
  end
end
