class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.where(:email => params[:session][:email].downcase).first
 	 if user && user.authenticate(params[:session][:name])
  	  # Sign the user in and redirect to the user's show page.
 	 else
  	   flash.now[:error] = 'Invalid name/email combination' # Not quite right!
      render 'new'
	 end
  end

  def destroy
  end
end
