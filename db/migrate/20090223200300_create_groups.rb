class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :cestas

      t.timestamps
    end

    create_table :groups_users, :id => false do |t|
      t.references :group
      t.references :user
    end

    Group.create(:id => 1, :name => 'CyL', :description => 'Todas estamos en crestas y lechugas')
    Group.create(:id => 2, :name => 'Administración web', :description => 'Se encargan de gestionar la web')
  end



  def self.down
    drop_table :groups
    drop_table :groups_users
  end
end
