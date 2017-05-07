class CartsController < ApplicationController
    before_action :set_item, only: [:add_to_cart, :remove_from_cart]

    include ChessStoreHelpers::Cart

    def index 
        @cart_items = get_list_of_items_in_cart
        @total_cost = calculate_cart_items_cost
    end

    def add_to_cart
        add_item_to_cart(@item.id.to_s)
        redirect_to index_path
    end

    def remove_from_cart
        remove_item_from_cart(@item.id.to_s)
        redirect_to index_path
    end

    # def checkout
    #     clear_cart
    #     redirect_to new_order_path
    # end

    def set_item
        @item = Item.find(params[:id])
    end
end