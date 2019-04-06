class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
     @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
  flash[:notice] = "service was created"
  @service = Service.create(service_params)
  redirect_to @service
  end

  def show
  end
  
  def edit
  end

  def update
    @service.update(service_params)
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

  def service_params
    params.require(:service).permit(:name, :bundle, :category, :package, :max_time, :pkg_amount, :hourly_rate)
  end
end
