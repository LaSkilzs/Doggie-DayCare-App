 class OwnersController < ApplicationController
  before_action :find_owner, only: [:show, :edit, :update, :destroy]
  include OwnersHelper

  def index
     @owners = Owner.all
  end

  def new
    if current_user.owners[0]
      getUser(current_user).update!(role: "owner")
      redirect_to owner_path(current_user.owners[0])
    else
      @owner = Owner.new
    end
  end

  def create
  @owner = Owner.create(owner_params)
  if @owner.save
      @owner.user.update!(role: "owner")
      flash[:notice] = "Owner was created"
      redirect_to @owner
    else
      @errors = @owner.errors.full_messages
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @owner.update(owner_params)
    redirect_to @owner
  end

  def destroy
    @owner.destroy
    flash[:notice] = "Owner was successfully deleted"
    redirect_to owners_path
  end
  
  private
  def find_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit!
  end

 
end
