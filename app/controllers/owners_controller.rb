 class OwnersController < ApplicationController
  before_action :find_owner, only: [:show, :edit, :update, :destroy]

  def index
     @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
  
  @owner = Owner.create(owner_params)
  if @owner.save
      flash[:notice] = "Owner was created"
      redirect_to @owner
    else
      @errors = @owner.errors.full_message
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
