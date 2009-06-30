class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :title
      t.string :category
      t.references :author, :null => false
      t.references :group, :null => false
      t.string :dialect, :default => 'textile'
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
