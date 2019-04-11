class WalkersController < ApplicationController
  before_action :find_walker, only: [:show, :edit, :update, :destroy]

  def index
     @walkers = Walker.all
  end

  def new
    @walker = Walker.new
  end

  def create
  flash[:notice] = "walker was created"
  @walker = Walker.create(walker_params)
  if @walker.save
      flash[:notice] = "walker was created"
      redirect_to @walker
    else
      # @errors = @walker.errors.full_message
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @walker.update(walker_params)
    redirect_to @walker
  end

  def destroy
    @walker.destroy
    flash[:notice] = "walker was successfully deleted"
    redirect_to walkers_path
  end
  
  private
  def find_walker
    @walker = Walker.find(params[:id])
  end

  def walker_params
    params.require(:walker).permit(:age, :experience, :own_dog, :rating, :user_id)
  end
end
