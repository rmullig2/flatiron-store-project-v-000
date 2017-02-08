class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  has_one :current_cart
  #attr_reader :current_cart
  
  #def current_cart=(cart)
  #  @current_cart = cart
  #end
  
  attr_accessor :current_cart_id
  
  def current_cart_id
    cart = CurrentCart.find_by(user_id: self.id)
    if !cart.nil?
      cart.cart_id
    else
      nil
    end
  end
  
  def create_current_cart
    new_cart = carts.create
    CurrentCart.create(user_id: self.id, cart_id: new_cart.id)
    self.current_cart_id = new_cart.id
    save
  end
  
  #def current_cart
  #  binding.pry
  #  if self.current_cart_id.nil?
  #    return nil
  #  else
  #    Cart.find(self.current_cart_id)
  #  end
  #end
end
