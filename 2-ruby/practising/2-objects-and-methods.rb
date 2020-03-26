puts 12.class
puts 1.class.superclass
puts 1.class.superclass.superclass
puts 1.class.superclass.superclass.superclass
puts "asd".class
puts 1.2.class
puts :symbol.class
puts ("asd"+"efg").class
puts 1.+(2).==(3)
puts "-------------------"
#print 123.methods
puts ""
#print Integer.methods
puts ""
puts "-------------------"
puts "sad".object_id
puts "zafer"

def my_method input1, input2
    input1 + input2
end

puts my_method(5,9)