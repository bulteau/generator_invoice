class Api::V1::InvoicesController < Api::V1::BaseController

  def index
    respond_with Invoice.all
  end

  #Generate an invoice from a contrat monthly rate, without save in database
  def simulator
    @invoice = Invoice.new(:contract_monthly_rent => params[:invoice][:contract_monthly_rent])
    render json: @invoice
  end

  #Add other API methods here
end
