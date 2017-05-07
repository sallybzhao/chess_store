class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_login, except: [:new, :create]
  authorize_resource

  def index
    @orders = Order.chronological.paginate(:page => params[:page]).per_page(7)
    @my_orders = current_user.orders.chronological.to_a
  end

  def show
    @order_items = @order.order_items.to_a
  end

  def new
    @order = Order.new
  end

  def edit
    
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "Successfully created new order!"
    else
      flash[:error] = "This order could not be created."
      render "new"
    end
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = "#{@order.id} is updated."
      redirect_to @order
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order.destroy
    flash[:notice] = "Successfully removed #{@order.id} from Chess Direct."
    redirect_to orders_url
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:date, :school_id, :user_id, :grand_total, :payment_receipt)  
    end
end
