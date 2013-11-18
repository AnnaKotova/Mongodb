сonfig.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  #config.action_mailer.default_url_options = { :host => "localhost:3000"}
  config.action_mailer.smtp_settings = {
      :address       => "smtp.gmail.com",
       :port          => "587",
       :domain         => 'gmail.com',
        :authentication => :plain,
         :user_name      => "anuta.kotova",
         :password       => "80668027682anna"
  }  