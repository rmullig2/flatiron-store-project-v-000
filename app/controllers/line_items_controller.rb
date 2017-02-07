class LineItemsController < ApplicationController
  
  def create
    #binding.pry
    if current_user.current_cart.nil?
      current_user.create_current_cart
      current_cart = Cart.find_by(id: current_user.current_cart_id, user_id: current_user.id)
      #binding.pry
    end
   #binding.pry
    current_cart.line_items << LineItem.create(item_id: params[:item_id], cart_id: current_cart.id)
    redirect_to cart_path(current_cart.id)
    #binding.pry
  end

end
