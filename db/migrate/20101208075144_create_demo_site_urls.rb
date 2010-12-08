class CreateDemoSiteUrls < ActiveRecord::Migration
  def self.up
    create_table :demo_site_urls do |t|
      t.text :url

      t.timestamps
    end
  end

  def self.down
    drop_table :demo_site_urls
  end
end
