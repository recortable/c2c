class CreateLabelsAndMarks < ActiveRecord::Migration
  def self.up
    create_table :labels do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :marks do |t|
      t.references :label
      t.references :content
      t.references :user
    end
  end

  def self.down
    drop_table :labels
    drop_table :marks
  end
end
