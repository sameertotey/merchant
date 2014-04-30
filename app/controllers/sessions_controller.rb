class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(auth_hash)
    session[:user_id] = user.id
    load_order
    @order.update_attributes(user: user)
    redirect_to root_path, notice: "Logged in as #{user.name}"
  end

  def destroy
    session[:user_id] = nil 
    session[:order_id] = nil
    redirect_to root_path, notice: "Goodbye!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
