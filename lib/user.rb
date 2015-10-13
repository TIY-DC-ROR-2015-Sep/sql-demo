class User < ActiveRecord::Base
  validates_presence_of :first_name

  has_many :orders
  has_many :items, through: :orders
  has_many :addresses

  def name
    first_name + " " + last_name
  end

  # def orders
  #   Order.where user_id: self.id
  # end

  def total_spent
    orders.map { |o| o.profit }.reduce :+
  end
end
