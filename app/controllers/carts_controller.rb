class CartsController < ApplicationController

    include ChessStoreHelpers::Cart

    def index 
        @cart_items = get_list_of_items_in_cart
        @total_cost = calculate_cart_items_cost
    end

    def add_to_cart
        add_item_to_cart("1")
    end

end