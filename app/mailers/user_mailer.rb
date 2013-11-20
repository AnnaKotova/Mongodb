class UserMailer < ActionMailer::Base
  default sender: 'anuta.kotova@gmail.com'
#content_type = "text/html"

  def welcome_email(user)
    @user = user
    #email_with_name = "#{@user.name} <#{@user.email}>"
    #mail(to: email_with_name, subject: 'Welcome')
    #@url  = 'http://example.com/login'
   mail(to: user.email, subject: 'Welcome') 
  end

 
end
