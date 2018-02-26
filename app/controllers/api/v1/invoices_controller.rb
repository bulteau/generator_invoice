class Api::V1::InvoicesController < Api::V1::BaseController
  def index
    respond_with Invoice.all
  end

  def simulator
    puts "debut"

    @invoice = Invoice.new(:contract_monthly_rent => params[:invoice][:contract_monthly_rent])
    render json: @invoice
  end
end
