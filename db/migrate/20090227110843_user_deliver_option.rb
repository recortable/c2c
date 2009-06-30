class UserDeliverOption < ActiveRecord::Migration
  def self.up
    add_column :users, :deliver, :boolean

    User.find(:all).each {|u| u.update_attribute(:deliver, true)}
  end

  def self.down
    remove_column :users, :deliver
  end
end
