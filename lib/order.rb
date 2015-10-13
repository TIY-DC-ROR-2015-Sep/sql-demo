class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  
  # def item
  #   @item ||= Item.find(self.item_id)
  # end

  def profit
    self.quantity * item.price
  end
end
