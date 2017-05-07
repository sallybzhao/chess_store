class PurchasesController < ApplicationController
  authorize_resource
  before_action :check_login
  
  def index
    @purchases = Purchase.chronological.paginate(:page => params[:page]).per_page(7)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current

    respond_to do |format|
      if @purchase.save
        
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @item_price }
        @purchases = Purchase.all.chronological.to_a
        format.js
      else
        format.html { render action: 'new' }
        # format.json { render json: @item_prices.errors, status: :unprocessable_entity }
        #render action: 'new'
      end
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:item_id, :quantity)
  end
  
end