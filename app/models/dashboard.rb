
class Dashboard
  def posts
    @posts ||= Content.find(:all, :conditions => {:category => 'post'}, :order => 'id DESC', :limit => 1)
  end

  def todo
    @todo ||= Content.find(:last, :conditions => {:category => 'htodo'})
  end

  def hcal
    @hcal ||= Content.find(:last, :conditions => {:category => 'hcal'})
  end

  def docs
    @docs ||= Content.find(:all, :conditions => {:category => 'document'}, :order => 'id DESC', :limit => 5)
  end

  def news
    Content.find(:all, :conditions => {:category => 'news'}, :order => 'id DESC', :limit => 5)
  end

  def events
    Content.find(:all, :conditions => {:category => 'event'}, :order => 'id DESC', :limit => 5)
  end

  def contents
    @contents ||= Content.find(:all, :order => 'id DESC')
  end
end