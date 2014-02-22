require 'csv'
require 'pry'
#begin

def prompt(output)
  puts "#{output}"
  gets.chomp
end

def format_currency(currency)
  sprintf('%.2f', currency)
end

puts "Welcome to Michael & Bjorn's Coffee House"

menu=["1) Add item - $5.00 - Light", "2) Add item - $7.50 - Medium", "3) Add item - $9.75 - Bold", "4) Complete Sale", "5) Reporting"]
puts menu

Products=Struct.new(:item,:SKU,:retail,:wholesale)

File.open("products.csv",'r')
#coffee_light=Products.new("light",5555,"some price",another_price)
#coffee_light[0]==light

@products=[]

CSV.foreach('products.csv', headers: true) do |row|
  products=Products.new(row[1],row[0],row[3].to_f,row[2].to_f)
  @products<<products
  #[row[1],row[0],row[2],row[3]]
end
print @products
puts "That was the products array. Next up is data."
selection = 1
order = 0

def first_input
  selection=prompt("Make a selection").to_i 
  if selection==5
    #report
  elsif (1..3).include?(selection)
    order_array = Array.new(3,0)
    order=ordering(selection,order_array)
    print "Order:#{order}"
    puts "order"
  else wrong(true)
  end
  return order
end
def wrong(bool)
  puts "You lose. Would you like to try again?"
  bool ? first_input : true
end
  
def ordering(selection, order)
  if (1..3).include?(selection)
    quantity=prompt("How Many?").to_i
    puts @products[selection-1][2]
    order[selection-1]+=quantity
    puts "Subtotal: $#{format_currency(subtotal(order))}"
    selection=prompt("Make a selection").to_i 
    ordering(selection,order)
  elsif selection==4
    #binding.pry
    order.select {|x| x!=0}.each_with_index {|a,i| print "$#{format_currency(order[i]*@products[i][2])} - #{order[i]} #{@products[i][0]} \n"}
    return order
  else
    wrong(false)
    selection=prompt("Make a selection").to_i 
    ordering(selection,order)
  end
  total=subtotal(order)
  still_owed = total
  puts "The total amount due is $#{format_currency(total)}"
    while still_owed > 0
    amount_tendered = prompt("What is the amount tendered?").to_f
    still_owed -= amount_tendered
    puts still_owed.to_s + " Still owed."
    break if still_owed <= 0
    puts "WARNING: Customer still owes $#{format_currency(still_owed)}!"
  end
  change_due_successful_output(still_owed)
end

def change_due_successful_output(change)
  puts "===Thank You!==="
  puts "The total change due is $#{format_currency(change.abs)}"
  puts ""
  puts "#{Time.now.strftime("%F %I:%M %p")}"
end

def subtotal(array) array.each_with_index.inject(0) { |subtotal, (quantity, i)| subtotal + quantity*@products[i][2]} end

#Sale complete
#Reporting
#Bring in other shit from Cashier 2
#Export to CSV

first_input
