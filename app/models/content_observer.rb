
class ContentObserver < ActiveRecord::Observer
  observe :content

  def after_create(content)
    begin
      UserMailer.deliver_content_email(content, content.group.emails)
      content.delivered_at = Time.now
      content.update_record_without_timestamping
    rescue 
    end
    # #self.send_later(:send_content_email, content)
  end

  def send_content_email(content)
    begin
      # FIXME
      content.delivered_at = Time.now
      content.update_record_without_timestamping
      content.group.emails.each do |email|
        UserMailer.deliver_content_email(content, email)
      end
    rescue
    end
  end


end