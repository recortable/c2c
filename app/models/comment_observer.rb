
class CommentObserver < ActiveRecord::Observer
  observe :comment

  def after_create(comment)
    begin
      UserMailer.deliver_comment_email(comment, comment.content.group.emails)
      # #self.send_later(:send_comment_email, comment)
      Activity.create(:title => "#{comment.content.title} ha sido comentado",
        :model => 'Comment', :model_id => comment.id, :action => 'create')
    rescue
    end
  end

  def send_comment_email(comment)
    begin
      comment.content.group.emails do |email|
        UserMailer.deliver_comment_email(comment, email)
      end
    rescue
    end
  end
end
