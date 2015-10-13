class User < ActiveRecord::Base
  validates_presence_of :first_name

  def name
    first_name + " " + last_name
  end

  def orders
    Order.where user_id: user_id
  end

  def total_spent
    orders.map { |o| o.profit }.reduce :+
  end
end
