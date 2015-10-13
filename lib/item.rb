class Item < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders

  def users_that_have_ordered
    # or `Order.where(item_id: id).pluck(:user_id)`
    orders = Order.where item_id: self.id
    user_ids = orders.map { |o| o.user_id }
    User.find user_ids
  end
end
