scores=[75,100,85,65,84,87,95]
puts scores.inject {|sum,x|sum+x}./scores.length
puts scores.inject {|small,x|small<x ? small : x}
puts scores.inject {|big,x|big>x ? big : x}
