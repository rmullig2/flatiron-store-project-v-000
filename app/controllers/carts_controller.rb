class CartsController < ApplicationController
  
  def show
    @current_cart = Cart.find_by(id: params[:id], user_id: current_user.id)
  end
  
  def checkout
    current_cart = Cart.find_by(id: params[:id], user_id: current_user.id)
    current_cart.line_items.each do |li|
      item = Item.find(li.item_id)
      item.inventory -= li.quantity
      item.save
    end
    current_cart.update(status: "submitted")
    current_cart.update_attribute :line_items, nil
    #current_user.update(current_cart: nil)
    redirect_to cart_path(current_cart.id)
  end

end
