class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
     @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  flash[:notice] = "User was created"
  @user = User.create(user_params)
  redirect_to @user
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
    params.require(:user).permit(:name, :username, :email, :password)
  end
end