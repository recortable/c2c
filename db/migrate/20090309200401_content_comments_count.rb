class ContentCommentsCount < ActiveRecord::Migration
  def self.up
    add_column :contents, :comments_count, :integer

    Content.find(:all).each do |c|
      c.update_attribute(:comments_count, c.comments.count)
    end
  end

  def self.down
    remove_column :contents, :comments_count
  end
end
