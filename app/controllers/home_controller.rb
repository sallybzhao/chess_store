class HomeController < ApplicationController
  #authorize_resource
  #before_action :check_login, except: [:index, :show]
  
  def home
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end