class UserMailer < ApplicationMailer
  default from: "malin.ekelund@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
        to: "malin.ekelund@gmail.com",
        subject: "A new contact form message from #{name}")
  end
end
