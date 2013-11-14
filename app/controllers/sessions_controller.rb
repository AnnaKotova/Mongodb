class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.where(:email => params[:session][:email].downcase).first
    name = User.where(:name => params[:session][:name]).first
 	 if name && user && user.id == name.id
  	  sign_in_ user
      redirect_back_or user
 	 else
  	   flash.now[:error] = 'Invalid name/email combination' # Not quite right!
      render 'new'
	 end
  end

  def destroy
    sign_out_
    redirect_to root_url
  end
end
