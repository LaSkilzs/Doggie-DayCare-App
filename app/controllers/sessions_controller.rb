class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
       log_in(@user)
       redirect_to root_path 
    else
      flash[:notice] = "account was not logged in"
      render 'new'
    end
  end

  def directing(user)
    @user = user
    if @user.owners[0] && @user.role == "owner"
      redirect_to root_path
    elsif user.walkers[0] && @user.role == "walker"
      redirect_to walker_path(@user.walkers[0])
    else
      flash[:notice] = "Please create an owner or walker account"
      redirect_to @user
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
