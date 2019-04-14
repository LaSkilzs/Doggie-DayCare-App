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
  @user = User.create(strong_params[:user].slice(:name, :username, :password, :role, :email))
  # byebug
  if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "user was created"
      redirect_to @user
    else
      flash[:notice] = "user was not created"
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @user.update(strong_params[:user].slice(:name, :username, :password, :role, :email))
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
end
