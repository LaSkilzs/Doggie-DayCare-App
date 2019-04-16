class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
     @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
  @appointment = Appointment.new(appointment_params)
    if @appointment.save
      Invoice(amount: @appointment.service.pkg_amount, walked: false, walk_rating: 0, appointment_id: @appointment_id)
      
      flash[:notice] = "appointment was created"
      redirect_to @appointment
    else       
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    @appointment.update(appointment_params)
    redirect_to @appointment
  end

  def destroy
    @appointment.destroy
    flash[:notice] = "appointment was successfully deleted"
    redirect_to appointments_path
  end
  
  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit!
  end


end
