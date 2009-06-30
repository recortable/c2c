class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.references :user, :null => false
      t.references :content, :null => false
    end

    contents = Content.find :all
    contents.each {|c| c.subscriptions.create!(:user_id => c.author.id)}
  end

  def self.down
    drop_table :subscriptions
  end
end
