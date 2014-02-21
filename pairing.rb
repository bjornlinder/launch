require 'pry'
 
#Command line: Prompt user to input one teammember name at a time, until they are done.
 
def input_name
  print "Enter a name. Type 'done' when finished. "
  name= gets.chomp
  if !/[a-zA-Z]/.match(name)
    puts "Invalid"
    name = input_name
  end
  name
end
 
def get_names
  name_array = []
  loop do
    name = input_name
    break if name=='done'
    name_array << name
  end
  name_array
end
 
# name_array = get_names
 
#Ask how many sets of pairs user wants to generate.
#pairing_num
def days_to_pair(name_array)
  puts "For how many days would you like to generate pairs?"
  days = gets.chomp.to_i
  if days > (name_array.length.to_i - 1) || days < 0
    puts "Please enter a number more than 0 but less than #{name_array.length - 1}"
    days = days_to_pair(name_array)
  end
  days
end
 
 
 
def make_me_pairs(name_array)
   days_wanted = days_to_pair(name_array)
  tbd = name_array.combination(2).to_a
  here_are_the_pairs = []
  days_wanted.times do
    pairs_array = Array.new
    (name_array.length/2).times do
      pairs_array << tbd.pop
    end
    here_are_the_pairs << pairs_array
  end
here_are_the_pairs
end
 
  def show_me_the_pairs(day_pairs_array)
    day_pairs_array.each_with_index do |day, index|
      puts "Day #{index + 1}"
      print day
      puts
    end
  end
 
 
  show_me_the_pairs (make_me_pairs(get_names))