puts "Pull my finger"
gets.chomp
MAX=100000000000
NUMBER=42
puts "Just kidding. Guess a number between 0 and #{MAX}:"

#guess=gets.chomp
while true
  guess=gets.chomp.to_i
  wrong= guess>NUMBER ? "You're too high. You shouldn't be driving." : guess<NUMBER ? "Too low." : false
  break if !wrong
  puts wrong
end
puts "Congratulations, you've guessed the number"

  #puts "Congratulations, you've guessed the number" ? guess==number