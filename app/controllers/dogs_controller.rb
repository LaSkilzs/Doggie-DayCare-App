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
    @dog = Dog.create(strong_params[:dog].slice(:name, :age, :breed, :size, :restrictions, :friendliness, :image, :owner_id))
  if @dog.save
      redirect_to @dog
    else
      # @errors = @dog.errors.full_message
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @dog.update_attributes(dog_params)
      flash[:notice] = "dog was created"
      redirect_to @dog
    else
      # @errors = @dog.errors.full_message
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
end
