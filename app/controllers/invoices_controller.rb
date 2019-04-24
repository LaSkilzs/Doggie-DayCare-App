class InvoicesController < ApplicationController
  before_action :find_invoice, only: [:show, :edit, :update, :destroy]

  def index
    if params[:dog_id]
     @invoices = Dog.find(params[:dog_id]).invoices.order(appointment_id: :asc).page(params[:page]).per(5)
    elsif params[:owner_id]
      @invoices = Owner.find(params[:owner_id]).invoices.order(appointment_id: :asc).page(params[:page]).per(5)
    else
      @appointments = getUser(current_user).walkers[0].appointments
      @invoices = @appointments.map{|appointment|appointment.invoice}
    end
  end

  def new
    @invoice = Invoice.new
  end

  def create
  @invoice = Invoice.create(invoice_params)
  if @invoice.save
      flash[:notice] = "invoice was created"
      redirect_to @invoice
    else
      # @errors = @invoice.errors.full_message
      render :new
    end
  end

  def show
    if params[:dog_id]
      @dog = Dog.find(params[:id])
    end
  end
  
  def edit
  end

  def update
      if @invoice.update(invoice_params)
        flash[:notice] = "appointment was created"
        redirect_to @invoice
      else
        @errors = @invoice.errors.full_message
        render :edit
      end
  end

  def destroy
    @invoice.destroy
    flash[:notice] = "invoice was successfully deleted"
    redirect_to invoices_path
  end
  
  private
  def find_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:amount, :walked, :walk_rating, :notes, :owner_comments, :walker_comments, :appointment_id)
  end
end
