class UserNotDeliverAndColorPref < ActiveRecord::Migration
  def self.up
    remove_column :users, :deliver
    add_column :users, :color, :string

    User.find(:all).each {|u| u.color = '#58DF37'}
  end

  def self.down
    remove_column :users, :color
    add_column :users, :deliver, :boolean
    User.find(:all).each {|u| u.update_attribute(:deliver, true)}
  end

end
