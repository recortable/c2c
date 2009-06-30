class Label < ActiveRecord::Base
  has_and_belongs_to_many :contents, :order => 'id DESC'
  has_many :users, :through => :marks
end
