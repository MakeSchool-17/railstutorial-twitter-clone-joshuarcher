class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

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
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      # handle error
      render 'new'
    end
  end

  def edit
    # when editting user should already be defined
    # => it should redirect if not
    # @user = User.find(params[:id])
  end

  def update
    # when editting user should already be defined
    # => it should redirect if not
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # handle a successful update
      flash[:success] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  # def index
  # end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
