class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :home, :show]
  before_filter :correct_user,   only: [:edit, :update]
  
  def home
    #@user = User.find(params[:id])
    redirect_to  :controller => 'sessions', :action => 'new'
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
     #UserMailer.welcome_email(@user).deliver
      #sign_in_ @user
      flash[:notice] = "Signup successful. Activation e-mail has been sent"
      redirect_to  :controller => 'sessions', :action => 'new'
     #render 'new'
     # flash[:success] = "Welcome!"
      #redirect_to "signed_in_"
      
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end


def accept_invitation
      @user = User.find_by_email_token(params[:email_token])
      @user.email_activation_token = true
      @user.save
      redirect_to root_url, :notice => "Email has been verified."
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
