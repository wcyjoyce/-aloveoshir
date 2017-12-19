class MessageMailer < ApplicationMailer
  def confirmation(message)
    @message = message
    mail(to: @message.email, subject: "Thanks for sending love to Shirley and Alan! ❤")
  end
end
