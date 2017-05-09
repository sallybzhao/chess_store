class HomeController < ApplicationController
  #before_action :check_login, except: [:index, :show]
  
  def home
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
    @not_shipped = Order.not_shipped.chronological.to_a

    if logged_in?
      @my_orders = current_user.orders.chronological.to_a
      #@schools = current_user.orders.for_school(2)
    end
  end

  def ship
    @order_item = OrderItem.find(params[:id])
    @order_item.update_attributes(:shipped_on => Date.today)
    #@order_item.save

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

  def about
  end

  def contact
  end

  def privacy
  end

  def complete
    
  end
  
end