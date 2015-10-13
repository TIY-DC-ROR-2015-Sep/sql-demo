require "pry"
require "./db/setup"
require './lib/all'

puts "This is in calc.rb"

puts "There are #{User.count} users in the db"

# Selecting
User.where({first_name: "James"})
User.where({last_name: "Kim"})
User.where({first_name: "Tom", last_name: "Crawford"})

# Item.maximum(:price).to_s
item = Item.order({price: :desc}).first
puts "The most expensive item is #{item.name}, at $#{item.price}"

# Pages of users
User.limit(5) # User.first(5)

# Total amount of money spent by user
def total_spent_by_user user_id
  # orders = Order.where user_id: user_id
  # orders.map { |o| o.profit }.reduce :+
  User.find(user_id).total_spent
end

binding.pry
