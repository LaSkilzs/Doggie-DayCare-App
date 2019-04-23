class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]

  def index 
    if params[:walker_id]
      @dogs = Walker.find(params[:walker_id]).dogs.order(age: :asc)
    else
      @dogs = Dog.order(age: :asc)
    end
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save
      flash[:notice] = "dog was created"
      redirect_to @dog
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @dog.update(dog_params)
      flash[:notice] = "dog was created"
      redirect_to @dog
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    flash[:notice] = "dog was successfully deleted"
    redirect_to dogs_path
  end
  
  private
  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit!
  end
end
