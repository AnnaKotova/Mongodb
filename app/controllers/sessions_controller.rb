class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.where(:email => params[:session][:email]).first
   if user && user.authenticate(params[:session][:password])
  	  sign_in_ user
      redirect_back_or user
 	 else
  	   flash.now[:error] = 'Invalid password/email combination' # Not quite right!
      render 'new'
	 end
  end

  def destroy
    sign_out_
    redirect_to root_url
  end
end
