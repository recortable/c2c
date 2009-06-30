class AddSomeIndexForPerformance < ActiveRecord::Migration
  def self.up
    add_index :users, :name
    add_index :contents, :updated_at
  end

  def self.down
    remove_index :users, :name
    remove_index :contents, :updated_at
  end
end
