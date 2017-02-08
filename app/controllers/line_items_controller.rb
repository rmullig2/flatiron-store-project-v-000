class LineItemsController < ApplicationController
  
  def create
    if current_user.current_cart_id.nil?
      current_user.create_current_cart
    end
    cart = Cart.find_by(id: current_user.current_cart_id, user_id: current_user.id)
    #binding.pry
    in_cart = false
    cart.line_items.each do |li|
      #binding.pry
      if li.item_id == params[:item_id].to_i
        in_cart = true
        li.quantity += 1
        li.save
      end
    end
    if !in_cart
      cart.line_items << LineItem.create(item_id: params[:item_id], cart_id: cart.id)
    end
    redirect_to cart_path(cart.id)
  end

end
