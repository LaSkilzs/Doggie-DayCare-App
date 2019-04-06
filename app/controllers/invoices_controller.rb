class InvoicesController < ApplicationController
  before_action :find_invoice, only: [:show, :edit, :update, :destroy]

  def index
     @invoices = Invoice.all
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
  end
  
  def edit
  end

  def update
    if @invoice.upate_attributes(invoice_params)
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
