require 'pry'
[5,8,2,6,9]
def simplesort(array, index=0, back=false)
print "\n #{array} Index: #{index} Array(Index): #{array[index]}"
	#if array[index]>array[index2]
	#	placeholder=array[index]
	#	array[index]=array[index2]
	#	array[index2]=placeholder
	#	puts "\n#{index}; #{index2}"
	#end
	if array[index]>array[index+1]
		placeholder=array[index]
		array[index]=array[index+1]
		array[index+1]=placeholder
		puts "\n#{index}; array.length #{array.length}"
	end
	if index==0 && back
		return array
	elsif index+2==array.length || back
		simplesort(array,index-1,true)
	else
		puts "Doing else."
		simplesort(array,index+1)
	end
end

x= simplesort([5,8,2,6,9,2])
puts "\nAnd the result:"
print x