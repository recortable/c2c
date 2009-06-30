class ContentDeliverAndIndexes < ActiveRecord::Migration
  def self.up
    add_column :contents, :delivered_at, :datetime
    add_index :contents, :category
  end

  def self.down
    remove_column :contents, :delivered_at
    remove_index :contents, :category
  end
end
