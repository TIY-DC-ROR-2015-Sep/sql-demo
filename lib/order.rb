class Order < ActiveRecord::Base
  def item
    @item ||= Item.find(self.item_id)
  end

  def profit
    self.quantity * item.price
  end
end
