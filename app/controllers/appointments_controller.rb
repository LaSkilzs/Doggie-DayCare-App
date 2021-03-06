class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  include AppointmentsHelper
  
  def index
    if params[:dog_id]
      @appointments = Dog.find(params[:dog_id]).appointments.order(status: :desc, date: :asc).page(params[:page]).per(5)
    elsif params[:walker_id]
     @appointments = Walker.find(params[:walker_id]).appointments.order(status: :desc, date: :asc).page(params[:page]).per(5)
    else
     @appointments = Appointment.where(status: :pending, booked: false).order(date: :asc).page(params[:page]).per(5)
    end
  end

  def new
    @appointment = Appointment.new
    if params[:dog_id]
      @dog = Dog.find(params[:dog_id])
    end
  end

  def create
  @appointment = Appointment.new(appointment_params)
  if @appointment.save
      @owner = Dog.find(appointment_params[:dog_id]).owner
      @invoice = Invoice.create(amount: @appointment.service.pkg_amount, walked: false, walk_rating: 0, appointment_id: @appointment.id, owner_id: @owner.id)
    
      flash[:notice] = "appointment was created"
      redirect_to invoice_path(@invoice)
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
