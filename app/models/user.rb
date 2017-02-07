class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  attr_reader :current_cart
  attr_accessor :current_cart_id
  #def current_cart=(cart)
  #  @current_cart = cart
  #end
  
  def create_current_cart
    new_cart = carts.create
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
