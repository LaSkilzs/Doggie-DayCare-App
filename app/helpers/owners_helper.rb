module OwnersHelper

  def toggle_owner (current_user)
    if current_user.walkers[0] 
      getUser(current_user).update!(role: "walker")
      redirect_to root_path
    else
      redirect new_walker_path
    end
  end


end
