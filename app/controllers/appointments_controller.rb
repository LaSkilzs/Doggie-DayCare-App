class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
     @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
  flash[:notice] = "appointment was created"
  @appointment = Appointment.create(appointment_params)
  redirect_to @appointment
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
    params.require(:appointment).permit(:date, :start_time, :status, :dog_id, :walker_id, :service_id)
  end
end
