class Item < ActiveRecord::Base
  def users_that_have_ordered
    # or `Order.where(item_id: id).pluck(:user_id)`
    orders = Order.where item_id: self.id
    user_ids = orders.map { |o| o.user_id }
    User.find user_ids
  end
end
