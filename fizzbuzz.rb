for i in 0..100
  x=""
  x<<"fizz" if i%3==0
  x<<"buzz" if i%5==0
  x=i if x==""
  puts x
end

def bzz (x,i)
  x<<"fizz" if i%3==0
  x<<"buzz" if i%5==0
  x=i if x==""
  puts x
end
for i in 0..100 do bzz("",i) end
  
  #Why doesnt this work?
for i in 0..100 do puts "fizzbuzz" ? i%15==0 : "fizz" ? i%3==0 : "buzz" ? i%5==0 : "" end

  #Fizzbuzz in 1 line!
for i in 0..100 do puts (i%15==0 && "fizzbuzz") || (i%3==0 &&"fizz") || (i%5==0 && "buzz") || i end

  #this one needs work.
bzzz={15=>"fizzbuzz",3=>"fizz",5=>"buzz",nil=>""}
for i in 0..100 do
  if i%bzzz.each {|x| x if i%x==0}
    
    