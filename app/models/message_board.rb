
class MessageBoard
  attr_reader :messages, :new_message

  def initialize(user, category)
    @user = user
    @category = category
    @messages = Content.find(:all, :conditions => {:category => @category}, :order => 'updated_at DESC', :limit => '20')
    @first = @messages.first
    @new_message = Content.new(:author_id => @user.id, :category => @category,
      :dialect => 'textile', :group_id => 1)
  end

  def answer(msg)
    Comment.new(:content_id => msg.id, :user_id => @user.id)
  end

  def hide?(msg)
    @first != msg
  end

  def key(name)
     "board_#{@category}_#{name}"
  end


end