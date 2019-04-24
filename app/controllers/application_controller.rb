class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :redirect, :booked?, :changeAccounts

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    current_user != nil
  end

  def log_out
    session.delete(:user_id)
    current_user = nil
  end

  def owner?
    current_user.id === session[:user_id]
  end

  def walker?

  end

  def redirect(path)
    redirect_to path
  end

  def booked?(current_user, appointment)
    if appointment.update(walker_id: current_user, status: 'confirmed')
      appoinment.toggle!(:booked)
    end
  end

  def changeAccounts(current_user)
    if current_user 
      user = User.find(current_user.id)
      if user.walkers[0] 
          if user.update!(role: "owner") 
            if user.owners[0]
              redirect_to owner_path(current_user) 
            else
                redirect_to new_owner_path
            end 
          end
      else
        if user.owners[0] 
          if user.update!(role: "walker") 
            if user.walkers[0]
              redirect_to walker_path(current_user) 
            else
                redirect_to new_walker_path
            end 
          end
       end
      end 
    end  
  end

end
