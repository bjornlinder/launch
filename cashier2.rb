class Float
  def money () "$#{sprintf("%.02f", self)}" end
end

@item_prices=[]
price=''

def total () @item_prices.inject{|total,x| total+x} end

while price !="done"
  puts "what is the sale price? Type 'done' when finished."
  price=gets.chomp
  @item_prices<<price.to_f
  puts "subtotal: "+ total.money
end

change=0
puts 'Enter the amount tendered.'
tendered=gets.chomp.to_f
change = tendered - total
if change < 0.00
	puts 'Not enough money, Bud...'
	exit
end
puts 'The change due to the customer is ' + change.money + '  ' + Time.now.asctime