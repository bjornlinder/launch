require 'pry'

phone_numbers = {
  'Dan'   => ['508.555.5555', '508.555.6666'],
  'Jenny' => ['508.867.5309', '508.697.5555'],
  'Sam'   => ['508.777.7777', '508.946.3214']
}

puts phone_numbers["Dan"][1]
puts phone_numbers["Sam"][0]
phone_numbers.each {|name, number| puts "#{name} can be reached at home @ #{number[0]} and at mobile #{number[1]}."}
  
@phone_numbers_2 = {
  'Dan'   => {
    crib: '508.555.5555', # !> useless use of a literal in void context
    celll: '508.555.6666'
  },
  'Jenny' => {
    crib: '508.867.5309',
    celll: '508.697.5555'
  },
  'Sam'   => {
    crib: '508.777.7777',
    celll: '508.946.3214'
  }
}

def give_me_yo_numba (name, numba_type, number_type2=false)
  puts "Yo homes, digits fo #{name}'s #{numba_type} is #{@phone_numbers_2[name][numba_type]}"
  puts " & #{numba_type2}  is #{number[1]}." if number_type2
end

give_me_yo_numba('Jenny',:celll)
give_me_yo_numba('Sam',:crib)
give_me_yo_numba('Dan',:celll)

@phone_numbers_2.each do |key,numbas|
  numbas.each do |numba| 
    give_me_yo_numba(key,numba[0])
  end
end

@phone_numbers_2['Jane']={celll: '508.555.3333'}
@phone_numbers_2['Sam']={pager: '508.222.2222'}
@phone_numbers_2['Tony']={celll: '508.333.3333',crib: '508.444.4444'}

def who_dat (numba)
  @phone_numbers_2.each do |peeps|
    peeps[1].each do |x|
      puts "Yo dog, you got #{peeps[0]}'s #{x[0]} numba" if x[1]==numba
    end
  end
end

who_dat('508.867.5309')
who_dat('508.555.6666')
