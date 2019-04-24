class WalkersController < ApplicationController
  before_action :find_walker, only: [:show, :edit, :update, :destroy]
  include WalkersHelper

  def index
     @walkers = Walker.all
  end

  def new
    if current_user.walkers[0]
      getUser(current_user).update!(role: "walker")
      redirect_to walker_path(current_user.walkers[0])
    else
      @walker = Walker.new 
    end  
  end

  def create
  @walker = Walker.create(walker_params)

  if @walker.save
      @walker.user.update!(role: "walker")
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
    params.require(:walker).permit!
  end

end
