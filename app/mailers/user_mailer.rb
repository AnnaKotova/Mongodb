class UserMailer < ActionMailer::Base
  default sender: 'anuta.kotova@gmail.com'

  def welcome_email(user)
    @user = user
    #email_with_name = "#{@user.name} <#{@user.email}>"
    #mail(to: email_with_name, subject: 'Welcome')
    #@url  = 'http://example.com/login'
   mail(to: "a.kotova@it-dimension.com", subject: 'Welcome to My Awesome Site') do |format|
  format.text
  format.html
end
   	
  end


#def activate(to, name, surname, id, sent_at = Time.now)
#@subject    = 'Account activation at Authenticate'
#@body['name']=name
#@body['surname']=surname
#@body['email']=to
#@body['id']=id
#@recipients = to
#@from = 'you@your_isp.com'
#@sent_on = sent_at
#@content_type = "text/html"
#end

 
end
