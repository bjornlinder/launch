require 'csv'

def input_items(array)
  input = nil
  until input == 'done'
    input = prompt("What is the sale price?")
    array << input.to_f # Convert input to float. 'done'.to_f returns 0.0
  end
  array.pop # Remove 'done' from the array
  puts "", "Subtotal: $#{format_currency(subtotal(array))}", ""
end

def prompt(output)
  puts "#{output}"
  input = gets.chomp
end

def subtotal(array)
  array.inject { |subtotal, price| subtotal + price}
  # The above line is functionally equivalent to the following:
  # subtotal = 0
  # array.each do |price|
  #   subtotal = subtotal + price
  # end
  # return subtotal

  # You could also use:
  # array.inject(:+)
end

def list_item_prices(array)
  puts "Here are your item prices:", ""
  array.each { |x| puts "$#{format_currency(x)}"}
end

def format_currency(currency)
  sprintf('%.2f', currency)
end

def change_due_successful_output(amount_tendered, total)
  puts "===Thank You!==="
  puts "The total change due is $#{format_currency(amount_tendered - total)}"
  puts ""
  puts "#{Time.now.strftime("%F %I:%M %p")}"
end

def change_due_failure_output(amount_tendered, total)
  puts "WARNING: Customer still owes $#{format_currency(total - amount_tendered)}! Exiting..."
end

sold_item_prices = []
input_items(sold_item_prices)
list_item_prices(sold_item_prices)
total = subtotal(sold_item_prices)
puts "The total amount due is $#{format_currency(total)}"
amount_tendered = prompt("What is the amount tendered?").to_f

if amount_tendered >= total
  change_due_successful_output(amount_tendered, total)
else
  change_due_failure_output(amount_tendered, total)
end

#load file

puts "Welcome to Michael & Bjorn's Coffee House"

puts "Make a selection"

menu=["1) Add item - $5.00 - Light", "2) Add item - $7.50 - Medium", "3) Add item - $9.75 - Bold", "4) Complete Sale", "5) Reporting"]
puts menu

selection=gets.chomp

Products=Struct.new(:item,:SKU,:retail,:wholesale)
File.open("products.csv")
coffee_light=Products.new("light",5555,"some price",another_price)
coffee_light[0]==light

CSV.foreach('products.csv', headers: true) do |row|
end