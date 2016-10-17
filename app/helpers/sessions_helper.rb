module SessionsHelper
  # Logs in the given user.
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  # Returns true if user is logged in, false if otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Returns the current logged in user (if any)
  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  # Store the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def current_user? user
    user == current_user
  end
end
