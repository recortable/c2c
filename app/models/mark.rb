class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :content
  belongs_to :label
  
end
