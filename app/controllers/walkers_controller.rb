class WalkersController < ApplicationController
  before_action :find_walker, only: [:show, :edit, :update, :destroy]

  def index
     @walkers = Walker.all
  end

  def new
    @walker = Walker.new
  end

  def create
  @walker = Walker.create(strong_params[:walker].slice(:age, :experience, :own_dog, :rating, :user_id))
     byebug
  if @walker.save
      flash[:notice] = "walker was created"
      redirect_to @walker
    else
      flash[:notice] = "something went  wrong😪"
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @walker.update(strong_params[:walker].slice(:age, :experience, :own_dog, :rating, :user_id))
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
    params.require(:walker).permit!
  end

end
