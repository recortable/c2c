class LabelsRedoux < ActiveRecord::Migration
  def self.up
    drop_table :marks

    create_table :contents_labels, :id => false do |t|
      t.references :label
      t.references :content
    end  end

  def self.down
    create_table :marks do |t|
      t.references :label
      t.references :content
      t.references :user
    end

    drop_table :contents_labels
  end
end
