class User < ActiveRecord::Base
  acts_as_authentic
  has_and_belongs_to_many :groups
  has_many :contents, :order => 'id DESC', :foreign_key => :author_id
  
  after_create :add_cyl

  def email
    login
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end


  private
  def add_cyl
    self.groups << Group.find(1)
    save
  end
end
