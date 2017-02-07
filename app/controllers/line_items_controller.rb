class LineItemsController < ApplicationController
  
  def create
    if current_user.current_cart.nil?
      current_user.current_cart = Cart.create(user_id: current_user.id)
    end
    current_user.current_cart.line_items << LineItem.create(item_id: params[:item_id], cart_id: current_user.current_cart.id)
    #binding.pry
  end

end
