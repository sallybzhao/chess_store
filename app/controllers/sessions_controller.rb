class SessionsController < ApplicationController
  include ChessStoreHelpers::Cart
  
  def new
    render :layout => false
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
      create_cart
    else
      @flash = "Email or password is invalid"
      redirect_to root_url
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
    destroy_cart
  end
end