class InvoicesController < ApplicationController
  before_action :find_invoice, only: [:show, :edit, :update, :destroy]

  def index
     @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
  flash[:notice] = "invoice was created"
  @invoice = Invoice.create(invoice_params)
  redirect_to @invoice
  end

  def show
  end
  
  def edit
  end

  def update
    @invoice.update(invoice_params)
    redirect_to @invoice
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
