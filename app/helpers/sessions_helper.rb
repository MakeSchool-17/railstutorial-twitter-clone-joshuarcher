module SessionsHelper

  # logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns the current logged-in user (if any)...
  def current_user
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user
    # end
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # return true if user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
  # logs out current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
