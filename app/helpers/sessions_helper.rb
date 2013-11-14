module SessionsHelper

	  def sign_in_(user)
    	cookies.permanent[:remember_token] = user.remember_token
    	self.current_user = user
  	end

	  def signed_in_?
    	!current_user.nil?
  	end

  	def current_user=(user)
    	@current_user = user
  	end

    def current_user?(user)
      user == current_user
    end

  	def current_user
    	@current_user ||= User.where( :remember_token => cookies[:remember_token]).first
  	end
	
	  def sign_out_
    	self.current_user = nil
    	cookies.delete(:remember_token)
  	end

    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

    def store_location
      session[:return_to] = request.url
    end
end
