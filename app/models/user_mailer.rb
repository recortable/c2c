class UserMailer < ActionMailer::Base
  layout 'mail'
  helper :contents, :application, :user_mailer, :link_to_model

  GROUP = "crestasylechugas@yahoogroups.com"
  default_url_options[:host] = "crestasylechugas.org"
  HOST = "crestasylechugas.org"

  def password_reset_instructions(user)
    recipients    user.email
    from          "crestasylechugas.org"
    subject       "Cambiar la clave de crestasylechugas.org"
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
    sent_on       Time.now
    content_type  "text/html"
  end

  def comment_email(comment, recipients)

    content = comment.content

    recipients    recipients
    from          "Comentarios en crestasylechugas.org"
    subject       "#{Category.title(content.category)}: #{content.title}"
    body          :content_url => content_path(content), :comment => comment, :content => content
    sent_on       Time.now
    content_type  "text/html"
  end

  def content_email(content, recipients)
    recipients recipients
    from "Contenidos en crestasylechugas.org"
    subject "#{Category.title(content.category)}: #{content.title}"
    body :content => content
    sent_on Time.now
    content_type "text/html"
  end
end
