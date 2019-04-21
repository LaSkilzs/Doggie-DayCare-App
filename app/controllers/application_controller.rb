class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
    byebug
  end

  def logged_in?
    current_user != nil
  end

  def log_out
    session.delete(:user_id)
    current_user = nil
  end

end
