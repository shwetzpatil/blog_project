class SubscriptionMailer < ApplicationMailer
  
  def mail_subscribers(article)
    @message = "A new article has been published"
    puts "Sending mails started"
    Subscribe.all.each do |subscribed|
      puts "sending article: #{article.title} to #{subscribed.email}"
      send_email(subscribed.email, article)
    end
    puts "Sending mails done"
  end


  private
  def send_email(email,article)    
    @article = article
    mail(to: email, subject: @article.title)
  end

end

