class UserNotifierMailer < ApplicationMailer
  default from: 'leo424y@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_mail(mail, subject)
    mail( 
      to: mail,
      subject: subject
      )
  end  
end


