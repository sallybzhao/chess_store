class OrderItemsController < ApplicationController

  def ship
    @order_item = OrderItem.find(params[:id])
    @order_item.update_attributes(:shipped_on => Date.today)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @home, notice: 'Order was successfully shipped.' }
        @not_shipped = Order.not_shipped.chronological.to_a
        format.js
      else
        format.html { render action: 'home' }
      end
    end
  end

end