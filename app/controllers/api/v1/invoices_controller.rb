class Api::V1::InvoicesController < Api::V1::BaseController
  def index
    #puts Item.new(1, "naaaaa", "deeeee")
    respond_with Invoice.all
  end

  def simulator
    puts "debut"
    
    @invoice = Invoice.new
    render json: @invoice
  end
end
