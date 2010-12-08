class CreateDemoHostSettings < ActiveRecord::Migration
  def self.up
    create_table :demo_host_settings do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :demo_host_settings
  end
end
