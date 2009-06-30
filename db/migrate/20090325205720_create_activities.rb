class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :title
      t.string :model
      t.string :action
      t.integer :model_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
