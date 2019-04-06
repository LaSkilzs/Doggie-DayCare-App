class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]

  def index
     @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
  flash[:notice] = "dog was created"
  @dog = Dog.create(dog_params)
  redirect_to @dog
  end

  def show
  end
  
  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to @dog
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
    params.require(:dog).permit(:name, :age, :breed, :size, :restrictions, :friendliness, :image, :owner_id)
  end
end
