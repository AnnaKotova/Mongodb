class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :home, :show]
  before_filter :correct_user,   only: [:edit, :update]
  
  def home
    #@user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.where(:id => params[:id]).first
  end
  def new
    #UserMailer.welcome_email(@user).deliver
  	 @user = User.new
  end
  def create
  	  @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in_ @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end

#if not_wanted?(@user.email.to_s)  # user submitted an email address from a web mail host
#        flash[:warning] = "Your email address appears to be web based"
#       render  :action => 'new'
#   elsif @user.save
#        @user.send_activate
#        flash[:notice] = "Signup successful. Activation e-mail has been sent"
#        redirect_to  :controller => 'logins', :action => 'login'
#    else
#        flash[:warning] = "Please try again - problems saving your details to the database"
#        render :action => 'new'
#    end


  end

  def edit
  end

  def update
  end

  private

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in_?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
