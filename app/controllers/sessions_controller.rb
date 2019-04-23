class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
        if @user.owners[0]
          redirect_to owner_path(@user.owners[0])
        elsif @user.walkers[0]
          redirect_to walker_path(@user.walkers[0])
        else
          flash[:notice] = "Please create an owner or walker account"
          redirect_to @user
        end
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
