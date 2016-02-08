class SessionsController < ApplicationController
  def new
  end

  # changed user variable to instance @user variable
  # so we can access it in testing suite as assigns(:user)
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # log in user
      log_in @user
      # if params[:session][:remember_me] == '1'
      #   remember user
      # else
      #   forget user
      # end
      # same as above ^^
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      #create an error
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
