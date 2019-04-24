module WalkersHelper
  
  def toggle_walker (current_user)
    if current_user.owners[0] 
      getUser(current_user).update!(role: "walker")
      redirect_to root_path
    else
      redirect_to new_owner_path
    end
  end
end
