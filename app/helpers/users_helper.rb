module UsersHelper
   
  def direct(user)
    if user.owners[0] && user.role == "owner"
       redirect_to owner_path(user.owners[0])
      elsif user.walkers[0] && user.role == "walker"
       redirect_to walker_path(user.walkers[0])
      elsif user.role == "owner"
       redirect new_owner_path
      elsif user.role == "walker"
       redirect new_walker_path
      else
       flash[:errors] = "something went wrong"
       redirect root_path
    end
  end
end
    
      
    
