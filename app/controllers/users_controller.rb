require 'byebug'

class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
     @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  @user = User.create(user_params)
  # byebug
  if @user.save
      log_in(@user)
      flash[:notice] = "user was created"
      if @user.owners[0].id 
        redirect_to owner_path(@user.owners[0])
      elsif @user.walkers[0].id
        redirect_to walker_path(@user.walkers[0])
      else
        @user
      end
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was successfully deleted"
    redirect_to users_path
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit!
  end
end
