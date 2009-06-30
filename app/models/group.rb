class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :order => 'login'
  has_many :contents,  :order => 'id DESC'

  has_and_belongs_to_many :deliverables, :class_name => 'User', :conditions => {:deliver => true}

  def emails
    @emails ||= users.collect {|u| u.email}
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
