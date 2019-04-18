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
  render json: @user
  if @user.save
    session[:user_id] = @user.id
    redirect_to walkers_path
  else
    flas[:notice] = "invalid user info"
    redirect_to owners_path
  end
  # byebug
  # if @user.save && @user.authenticate(user_params[:password]) 
  #     flash[:notice] = "user was created"
  #     session[:user_id] = @user.id
  #     redirect_to @user
  #   else
  #     @errors = @user.errors.full_message
  #     render :new
  #   end
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
    params.require(:user).permit(:name, :username, :role, :email, :password)
  end
end
