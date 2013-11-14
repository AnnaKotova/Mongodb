class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :home]
  before_filter :correct_user,   only: [:edit, :update]
  
  def home
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def new
  	 @user = User.new
  end
  def create
  	  @user = User.new(params[:user])
    if @user.save
      sign_in_ @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
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
