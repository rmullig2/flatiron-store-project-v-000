class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  
  def total
    total = 0.0
    self.items.all.each do |item|
      total += item.price
    end
    total
  end
  
    
  def add_item(id)
    self.line_items.all.each do |li|
      if li.item_id == id
        li.quantity += 1
        return li
      end
    end
    LineItem.new(cart_id: self.id, item_id: id)
  end
  
end
