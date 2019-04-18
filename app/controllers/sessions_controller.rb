require 'byebug'
class SessionsController < ApplicationController

  def new  
  end
  
  # def create
  #   @user = User.find_by(email: params[:email])
  #   byebug
  #   if @user && @user.authenticate(params["password"])

  #   render json: @user
  #   else
  #     flash[:notice] = "invalid password"
  #     redirect_to root_path
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_path
  # end

  # private 
  
  # # def self.authenticate(password)
  # #   self.password_digest = BCrypt::Password.create(params[:password])
  # # end

  # def self.is_authenticate?(password)
  #   BCrypt::Password.new(self.password_digest) == password
  # end

 
end
