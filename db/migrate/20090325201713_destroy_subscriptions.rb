class DestroySubscriptions < ActiveRecord::Migration
  def self.up
    drop_table :subscriptions
  end

  def self.down
    create_table :subscriptions do |t|
      t.references :user, :null => false
      t.references :content, :null => false
    end

    contents = Content.find :all
    contents.each {|c| c.subscriptions.create!(:user_id => c.author.id)}
  end
end
