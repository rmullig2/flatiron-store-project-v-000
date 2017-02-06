class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  
  def self.available_items
    avail = []
    self.all.each do |item|
      item.inventory > 0 && avail << item
    end
    avail
  end

end
