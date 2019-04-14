class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
     @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
  @service = Service.create(strong_params[:services].slice(:name, :bundle, :category, :package, :max_time, :pkg_amount, :hourly_rate))
  if @service.save
      flash[:notice] = "service was created"
      redirect_to @service
    else
      flash[:notice] = "something went wrong"
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @service.update(strong_params[:services].slice(:name, :bundle, :category, :package, :max_time, :pkg_amount, :hourly_rate))
    redirect_to @service
  end

  def destroy
    @service.destroy
    flash[:notice] = "service was successfully deleted"
    redirect_to services_path
  end
  
  private
  def find_service
    @service = Service.find(params[:id])
  end

end
